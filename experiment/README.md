This is just an experiment to see how to implement some LaTeX constructs
in plain TeX. I don't think the notes are particular novel, just useful
for driving the exploration of TeX.

The LaTeX version is in `macros.sty` whereas the plain TeX version is in
`macros.tex`; and the jointly shared notational choices are found in
`notation.tex`.

Curiously, pdflatex (and pdftex) produce huge output files, double what
calling `dvipdfmx` on the latex (and plain tex) outputs. And even then,
the PDFs are about 5-times as big as the DVI files.

# Macros in Plain TeX not in LaTeX

One particular choice of macros in plain TeX which is not found in the
LaTeX macros are the paragraph numbering macros. We could write just a
sequence of paragraphs, either unlabeled `\M` or labeled `\N{My Paragraph}`.

We can also subdivide a paragraph. If we want a subparagraph, we can
write `\M[1]` or `\N[1]{My subparagraph}` to produce something like
"Chapter.Paragraph.Subparagraph". But why stop there? We could have a
sub-sub-paragraph `\M[2]` or `\N[2]{...}`, or an arbitrary depth `\M[k]`
or `\N[k]{...}` for any positive integer `k`.

Then invoking `\M` or `\N{...}` will continue along at this level of
depth `chapter.paragraph.[...].sub-k-paragraph` incrementing the
`sub-k-paragraph` counter.

We can return to a layer above by invoking `\M[-1]` or `\N[-1]{...}`.
And we can return to an arbitrary number of layers above with `\M[-k]`
or `\N[-k]{...}`.