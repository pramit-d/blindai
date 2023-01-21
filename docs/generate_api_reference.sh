# script to generate the python API reference
# pdoc3 must be installed (pip install pdoc3)
set -e

pdoc --html --skip-errors --template-dir docs/pdoc_template -o docs/ client/blindai_preview --force > /dev/null
sed -i '/<p>Generated by <a href="https:\/\/pdoc3.github.io\/pdoc" title="pdoc: Python API documentation generator"><cite>pdoc<\/cite> 0.10.0<\/a>.<\/p>/d' docs/blindai_preview/*.html
mv docs/blindai_preview/client.html docs/blindai_preview/index.html
rm docs/blindai_preview/utils.html
echo docs/blindai_preview/index.html