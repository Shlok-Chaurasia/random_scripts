#!/bin/bash
sed -e '/<article>/d' -e '/<\/article>/d' data_file_2 |
sed -e 's/<title>/Title:/g'|
sed -e 's/<\/title>//g'|
sed -e '/<para>/{ 
	s/<para>//g;
	/^\s*$/d;
        }'|
sed -e '/<\/para>/{
	 s/<\/para>//g;
	/^\s*$/d;
        }' |

sed -e 's/<emphasis>/\*/g'|
sed -e 's/<\/emphasis>/\*/g'|
sed -e 's/web/Web/g'| 
sed -e '/<listing>/,/<\/listing>/{
s/\&lt;/</g;
s/\&gt;/>/g;
s/\&amp;/\&/g;
}'|
sed -e 's/<listing>/\-\-\-begin listing/g'|
sed -e 's/<\/listing>/\-\-\-end listing/g'

: '
Lines with <article> and </article> should be deleted.
Replace <title> with Title:, and replace </title> with nothing.
Replace all <para> and </para> tags with the null string. If the resulting line is empty, delete the line. (You may need to use curly braces to make this happen.)
Replace all <emphasis> and </emphasis> tags with asterisks. Thus:
This is a <emphasis>great</emphasis> bargain.
will become
This is a *great* bargain.
Replace the word web with Web everywhere.
Replace lines starting with <listing> by ---begin listing
Replace lines starting with </listing> by ---end listing
Between the <listing> and </listing>, do these things (you must use curly braces to do this!):
Replace all occurrences of &lt; with <.
Replace all occurrences of &gt; with >.
Replace all occurrences of &amp; with &.
Note: you must do these operations in the order shown above; otherwise, you will get the wrong results!'







