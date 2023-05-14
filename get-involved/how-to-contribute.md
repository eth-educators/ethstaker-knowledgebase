# Como contribuir

Este é um site de documentação vivo, o que significa que precisamos da ajuda de toda a comunidade para manter e atualizar seu conteúdo. Qualquer contribuição, desde escrever seções inteiras, traduções, ou até mesmo corrigir erros de ortografia e gramática, serão muito bem-vindas.

Você pode ganhar GitPOAPs contribuindo diretamente para a Base de Conhecimento de EthStaker (como[ contribuidor↗](https://www.gitpoap.io/gp/881)) ou fazendo perguntas que levem à criação de conteúdo (como [apoiador](https://www.gitpoap.io/gp/923)[↗](https://www.gitpoap.io/gp/923)).

[![EthStaker Knowledge Base Contributor GitPOAP 2023](https://www.gitpoap.io/\_next/image?url=https%3A%2F%2Fassets.poap.xyz%2Fgitpoap3a-2023-ethstaker-knowledge-base-contributor-2022-logo-1671596764627.png\&w=384\&q=75)](https://www.gitpoap.io/gp/881)[![EthStaker Knowledge Base Supporter GitPOAP 2023](https://www.gitpoap.io/\_next/image?url=https%3A%2F%2Fassets.poap.xyz%2F2023-ethstaker-knowledge-base-supporter-2022-logo-1672411990803.png\&w=384\&q=75)](https://www.gitpoap.io/gp/923)

Para sugerir alterações ou adicionar novos conteúdos, visite nosso [EthStaker Github↗](https://github.com/eth-educators/ethstaker-knowledgebase) ou, se tiver alguma dúvida, entre em nosso [Discord↗](https://www.google.com/url?sa=t\&rct=j\&q=\&esrc=s\&source=web\&cd=\&cad=rja\&uact=8\&ved=2ahUKEwjpm6nC5K78AhUBi1wKHaxHCF8QFnoECAsQAQ\&url=https%3A%2F%2Fdiscord.com%2Finvite%2FucsTcA2wTq\&usg=AOvVaw0U61EK\_8NaT71SEZlw3aJS).&#x20;

Por favor, crie uma solicitação de pull para qualquer alteração que você queira fazer e nós a analisaremos o mais rápido possível.

* [Notas sobre a padronização da documentação](how-to-contribute.md#notas-sobre-a-padronizacao-da-documentacao)
* [Criação ou atualização de tabelas de conteúdo](how-to-contribute.md#criacao-ou-atualizacao-de-tabelas-de-conteudo)
* [Classificar glossário e perguntas frequentes em ordem alfabética](how-to-contribute.md#classificar-glossario-e-perguntas-frequentes-em-ordem-alfabetica)

## Notas sobre a padronização da documentação

Please use these notes when writing for this knowledge base to maintain a standardized format.

* Use [relative links ↗](https://github.blog/2013-01-31-relative-links-in-markup-files/) to navigate between different files within this knowledge base.
  * `[Other file link](other_file.md)` → [Other file link](how-to-contribute.md)
* Use anchor links to headings within the same file.
  * `[Anchor link](#heading-anchor)` → [Anchor link](how-to-contribute.md#documentation-standardization-notes)
* Combine relative links to other files with anchor links.
  * `[Other file anchor link](other_file.md#heading-anchor)` → [Other file link](how-to-contribute.md#documentation-standardization-notes)
* Show when a link is referencing an external site by adding the ↗ icon at the end of the link.
  * `[External site link ↗](https://example.com)` → [External site link ↗](https://example.com)
* Create an image that's also a link.
  * `[![image-text](https://some.site/your-image.jpg)](https://some.site/your-link.html)`

## Criação ou atualização de tabelas de conteúdo

The tables of contents are created using a VSCode extension [Markdown All in One ↗](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) using the command `Create Table of Contents` (in the [VS Code Command Palette ↗](https://code.visualstudio.com/docs/getstarted/userinterface#\_command-palette)) to insert a new table of contents. It should then automatically be updated when a file is saved.

Add the tag `<!-- omit in toc -->` to any headings you do not want to be included in the Table of Contents.

```
# HEADING <!-- omit in toc -->
```

## Classificar glossário e perguntas frequentes em ordem alfabética

Ao adicionar itens ao Glossário e às Perguntas frequentes, é importante que eles permaneçam em ordem alfabética para facilitar a navegação. Como não há uma maneira nativa de fazer isso com Markdown, você pode usar este script bash para reordenar os cabeçalhos.

> The file name `alphabetical-ordering.sh` has been added to the .gitignore file.

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

Executar o script.

```
./alphabetical-ordering.sh
```

> Este script foi feito rapidinho, sendo assim, se você tiver alguma melhoria, atualize-o aqui!
