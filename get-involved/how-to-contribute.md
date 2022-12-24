# How to Contribute to the EthStaker Knowledge Base <!-- omit in toc -->

This is a living documentation site, which means we need help from the community to maintain and update the content. Any contribution, from writing whole sections, translations, to simply correcting spelling and grammar mistakes will be greatly appreciated.

Please create a pull request for any changes you want to make and we'll review it as soon as possible.

- [Documentation standardization notes](#documentation-standardization-notes)
- [Creating/Updating tables of contents](#creatingupdating-tables-of-contents)
- [Glossary and FAQ heading ordering](#glossary-and-faq-heading-ordering)
- [Future support for multi-language](#future-support-for-multi-language)

## Documentation standardization notes

Please use these notes when writing for this knowledge base to maintain a standardized format.

- Use [relative links ↗](https://github.blog/2013-01-31-relative-links-in-markup-files/) to navigate between different files within this knowledge base.
  - `[Other file link](other_file.md)` → [Other file link](how-to-contribute.md)
- Use anchor links to headings within the same file.
  - `[Anchor link](#heading-anchor)` → [Anchor link](#documentation-standardization-notes)
- Combine relative links to other files with anchor links.
  - `[Other file anchor link](other_file.md#heading-anchor)` → [Other file link](how-to-contribute.md#documentation-standardization-notes)
- Show when a link is referencing an external site by adding the ↗ icon at the end of the link.
  - `[External site link ↗](https://example.com)` → [External site link ↗](https://example.com)

## Creating/Updating tables of contents

The tables of contents are created using a VSCode extension [Markdown All in One ↗](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) using the command `Create Table of Contents` (in the [VS Code Command Palette ↗](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette)) to insert a new table of contents. It should then automatically be updated when a file is saved.

Add the tag `<!-- omit in toc -->` to any headings you do not want to be included in the Table of Contents.

```
# HEADING <!-- omit in toc -->
```

## Glossary and FAQ heading ordering

When adding items to the Glossary and FAQ it's important that they remain in alphabetical order so it's easier to navigate. As there is no native way to achieve this in Markdown, you can use this bash script to reorder the headings.

> The file name `alphabetical-ordering.sh` has been added to the .gitignore file.

```
touch alphabetical-ordering.sh
chmod 700 alphabetical-ordering.sh
```

Edit the new file with your preferred text editor.

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

Run the script.

```
./alphabetical-ordering.sh
```

> This was a quick script, so if you have any improvements please update it here!

## Future support for multi-language

- https://www.dampfkraft.com/code/multilingual-markdown.html
  - Line in English :en
  - Same line in Spanish :sp
