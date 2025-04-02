# Como contribuir

Este é um site de documentação vivo, o que significa que precisamos da ajuda de toda a comunidade para manter e atualizar seu conteúdo. Qualquer contribuição, desde escrever seções inteiras, traduções, ou até mesmo corrigir erros de ortografia e gramática, serão muito bem-vindas.

Você pode ganhar GitPOAPs contribuindo diretamente para a Base de Conhecimento de EthStaker (como[ contribuidor↗](https://www.gitpoap.io/gp/881)) ou fazendo perguntas que levem à criação de conteúdo (como[ apoiador↗](https://www.gitpoap.io/gp/923)).

[![EthStaker Knowledge Base Contributor GitPOAP 2023](https://www.gitpoap.io/\_next/image?url=https%3A%2F%2Fassets.poap.xyz%2Fgitpoap3a-2023-ethstaker-knowledge-base-contributor-2022-logo-1671596764627.png\&w=384\&q=75)](https://www.gitpoap.io/gp/881)[![EthStaker Knowledge Base Supporter GitPOAP 2023](https://www.gitpoap.io/\_next/image?url=https%3A%2F%2Fassets.poap.xyz%2F2023-ethstaker-knowledge-base-supporter-2022-logo-1672411990803.png\&w=384\&q=75)](https://www.gitpoap.io/gp/923)

Para sugerir alterações ou adicionar novos conteúdos, visite nosso [EthStaker Github↗](https://github.com/eth-educators/ethstaker-knowledgebase) ou, se tiver alguma dúvida, entre em nosso [Discord↗](https://www.google.com/url?sa=t\&rct=j\&q=\&esrc=s\&source=web\&cd=\&cad=rja\&uact=8\&ved=2ahUKEwjpm6nC5K78AhUBi1wKHaxHCF8QFnoECAsQAQ\&url=https%3A%2F%2Fdiscord.com%2Finvite%2FucsTcA2wTq\&usg=AOvVaw0U61EK\_8NaT71SEZlw3aJS).&#x20;

Favor criar uma solicitação de pull para qualquer alteração que você queira fazer e nós analisaremos o mais rápido possível.

* [Notas sobre a padronização da documentação](#notas-sobre-a-padronizacao-da-documentacao)
* [Criação ou atualização do sumário](#criacao-ou-atualizacao-do-sumario)
* [Classificar glossário e perguntas frequentes em ordem alfabética](how-to-contribute.md#classificar-glossario-e-perguntas-frequentes-em-ordem-alfabetica)

## Notas sobre a padronização da documentação

Favor usar essas instruções ao escrever nesta base de conhecimento para manter um formato padronizado.

* Use [links relativos↗](https://github.blog/2013-01-31-relative-links-in-markup-files/) para navegar entre os diferentes arquivos desta base de conhecimento.
  * `[Other file link](other_file.md)` → [Link de outro arquivo](/pt/how-to-contribute)
* Use links âncora para títulos dentro do mesmo arquivo.
  * `[Anchor link](#heading-anchor)` → [Link âncora](/pt/how-to-contribute#notas-sobre-a-padronizacao-da-documentacao)
* Combine links relativos a outros arquivos com links âncora.
  * `[Other file anchor link](other_file.md#heading-anchor)` → [Link de outro arquivo](/pt/how-to-contribute#notas-sobre-a-padronizacao-da-documentacao)
* Mostre quando um link fizer referência a um site externo adicionando o ícone ↗ no final do link.
  * `[External site link ↗](https://example.com)` → [Link de site externo↗](https://example.com)
* Crie uma imagem que também é um link.
  * `[![image-text](https://some.site/your-image.jpg)](https://some.site/your-link.html)`

## Criação ou atualização do sumário

O sumário é criado com a extensão [Markdown All in One ↗](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) do VSCode usando o comando `Create Table of Contents` (na [paleta de comandos do VSCode↗](https://code.visualstudio.com/docs/getstarted/userinterface#\_command-palette)). Ele então deve ser atualizado automaticamente quando um arquivo for salvo.

Adicione a tag`<!-- omit in toc -->` a qualquer título que você não queira incluir no sumário.

```
# HEADING <!-- omit in toc -->
```

## Classificar glossário e perguntas frequentes em ordem alfabética

Ao adicionar itens ao Glossário e às Perguntas frequentes, é importante que eles permaneçam em ordem alfabética para facilitar a navegação. Como não há uma maneira nativa de fazer isso com Markdown, você pode usar este script bash para reordenar os cabeçalhos.

> O nome do arquivo`alphabetical-ordering.sh` foi adicionado ao arquivo .gitignore.

```
touch alphabetical-ordering.sh
chmod 700 alphabetical-ordering.sh
```

Edite o novo arquivo com seu editor de texto preferido.

```
#!/bin/bash
# Reorder glossary and store just the reordered content in a temp file
perl -0777 -ne '
    (undef,@paragraphs) = split /^##(?=[^##])/m;
    print map {"##$_"} sort @paragraphs;
' staking-glossary.md > staking-glossary-temp-1.md

# Delete everything after the first --- in and store in a temp file
sed '/---/q' staking-glossary.md > staking-glossary-temp-2.md

# Combine the two files
cat staking-glossary-temp-2.md > staking-glossary.md
cat staking-glossary-temp-1.md >> staking-glossary.md

# Delete the temp files
rm staking-glossary-temp-1.md
rm staking-glossary-temp-2.md


# Reorder FAQ and store just the reordered content in a temp file
perl -0777 -ne '
    (undef,@paragraphs) = split /^##(?=[^##])/m;
    print map {"##$_"} sort @paragraphs;
' faq.md > faq-temp-1.md

# Delete everything after the first --- and store in a temp file
sed '/---/q' faq.md > faq-temp-2.md

# Combine the two files
cat faq-temp-2.md > faq.md
cat faq-temp-1.md >> faq.md

# Delete the temp files
rm faq-temp-1.md
rm faq-temp-2.md
```

Execute o script.

```
./alphabetical-ordering.sh
```

> Este script foi feito rapidinho, sendo assim, se você tiver alguma melhoria, atualize-o aqui!
