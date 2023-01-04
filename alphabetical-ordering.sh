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
