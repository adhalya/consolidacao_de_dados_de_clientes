let
    Fonte = 
        Excel.Workbook(File.Contents("(COLAR LOCAL DO ARQUIVO)\Sales_January.xlsx"), null, true),

    Importando_Janeiro = 
        Fonte{[Item="Janeiro",Kind="Table"]}[Data],

    Combinando_Fev_Marco = 
        Table.Combine({Importando_Janeiro, Fevereiro, Março}),

    NIF_Texto = 
        Table.TransformColumnTypes(Combinando_Fev_Marco,{{"NIF", type text}}),

    Agrupar_Colunas_Dados = 
        Table.Group(NIF_Texto, {"NIF"}, {{"Dados", each _, type table [Cliente=nullable text, NIF=nullable text, Email=nullable text, Telefone=nullable number, Valor_Janeiro=nullable number, Morada=nullable text, Valor_Fevereiro=nullable number, Gestor_Conta=nullable text, Valor_Marco=nullable number]}}),

    Extrair_Clientes_NNulos = 
        Table.AddColumn(Agrupar_Colunas_Dados, "Cliente", each List.First(List.RemoveNulls([Dados][Cliente]))),

    Extrair_Email_NNulos = 
        Table.AddColumn(Extrair_Clientes_NNulos, "Email", each List.First(List.RemoveNulls([Dados][Email]))),

    Extrair_Telefone_NNulos =
        Table.AddColumn(Extrair_Email_NNulos, "Telefone", each List.First(List.RemoveNulls([Dados][Telefone]))),
        
    Extrair_Morada_NNulos = 
        Table.AddColumn(Extrair_Telefone_NNulos, "Morada", each List.First(List.RemoveNulls([Dados][Morada]))),

    Extrair_GestorC_NNulos = 
        Table.AddColumn(Extrair_Morada_NNulos, "Gestor_Conta", each List.First(List.RemoveNulls([Dados][Gestor_Conta]))),

    Extrair_Jan_NNulos = 
        Table.AddColumn(Extrair_GestorC_NNulos, "Valor_Janeiro", each List.First(List.RemoveNulls([Dados][Valor_Janeiro]))),

    Extrair_Fev_NNulos = 
        Table.AddColumn(Extrair_Jan_NNulos, "Valor_Fevereiro", each List.First(List.RemoveNulls([Dados][Valor_Fevereiro]))),

    Extrair_Mar_NNulos = 
        Table.AddColumn(Extrair_Fev_NNulos, "Valor_Marco", each List.First(List.RemoveNulls([Dados][Valor_Marco]))),

    Remover_Dados = 
        Table.RemoveColumns(Extrair_Mar_NNulos,{"Dados"}),
        
    Alterar_Tipos = Table.TransformColumnTypes(Remover_Dados,{{"NIF", Int64.Type}, {"Cliente", type text}, {"Email", type text}, {"Telefone", Int64.Type}, {"Morada", type text}, {"Gestor_Conta", type text}, {"Valor_Janeiro", Int64.Type}, {"Valor_Fevereiro", Int64.Type}, {"Valor_Marco", Int64.Type}})
in
    Alterar_Tipos