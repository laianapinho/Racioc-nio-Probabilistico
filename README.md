
# 🚲 Problema do Farol de Bicicleta em ProbLog

Este projeto implementa um modelo probabilístico no ambiente **ProbLog** para simular e inferir o funcionamento do farol de uma bicicleta, considerando fatores como condições da rua, desgaste de componentes, e o estado da fiação e lâmpada.

## 📄 Descrição do Problema

O farol da bicicleta funciona com base em um **dínamo**, que pode ou não gerar tensão suficiente dependendo de várias condições. O modelo leva em consideração:

- **Condições da rua (Str)**: seca, molhada ou coberta de neve.
- **Desgaste do volante do dínamo (Flw)**.
- **Estado da lâmpada (B)**.
- **Estado do cabo elétrico (K)**.
- **Deslizamento do dínamo (R)**.
- **Tensão gerada pelo dínamo (V)**.
- **Farol aceso ou não (Li)**.

O objetivo é analisar como essas variáveis se influenciam e calcular probabilidades condicionais úteis, como a chance de o dínamo gerar tensão ou o farol acender.

## 📊 Estrutura do Modelo Probabilístico

### Variáveis e Distribuições

- `str(X)`: condição da rua  
  - `dry` (70%), `wet` (20%), `snow_covered` (10%)

- `flw(X)`: desgaste do volante  
  - `true` (40%), `false` (60%)

- `b(X)`: lâmpada funcional  
  - `true` (80%), `false` (20%)

- `k(X)`: cabo funcional  
  - `true` (85%), `false` (15%)

- `r(X)`: dínamo desliza  
  - Depende de `str` e `flw`

- `v(X)`: dínamo gera tensão  
  - Depende de `r`

- `li(X)`: luz acende  
  - Depende de `v`, `b` e `k`

## 🔍 Consultas Realizadas

Foi feita uma **consulta condicional**, com a evidência de que a rua está **coberta de neve**:

```prolog
evidence(str(snow_covered)).
query(v(true)).
query(v(false)).
```

Essa consulta busca inferir a **probabilidade do dínamo gerar tensão (V=true)** e de **não gerar tensão (V=false)**, dado que a rua está coberta de neve.

## ▶️ Como Executar

Este código é escrito em **ProbLog**, uma linguagem baseada em Prolog para modelagem probabilística.

### Passos:

1. Acesse o [ProbLog Online Editor](https://dtai.cs.kuleuven.be/problog/editor.html#task=prob&hash=64ed51ea4efedd05447b77d6fb626cb2).
2. Cole o conteúdo do arquivo `.pl` no editor.
3. Clique em **"Run"** para executar o modelo e ver os resultados das consultas.

## 📌 Aplicações

Este tipo de modelagem pode ser aplicado em:

- Sistemas embarcados e diagnóstico de falhas.
- Simulações probabilísticas para IoT.
- Ensino de lógica probabilística e raciocínio incerto.

## 📁 Arquivo

- `farol_bicicleta.pl` – Código-fonte com toda a definição das probabilidades e regras.
