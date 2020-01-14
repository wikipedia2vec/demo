export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "{"
echo '  "embeddings": ['
for LANG in "ar" "de" "en" "es" "fr" "it" "ja" "nl" "pl" "pt" "ru" "zh"
    do
        python create_projector_data.py ${LANG}wiki_20180420_100d.pkl --tensor-file=${LANG}_emb.tsv --metadata-file=${LANG}_data.tsv --config-file=${LANG}_config.json --base-url=http://wikipedia2vec.github.io/demo/projector_files/
        sed -e '1,2d' -e '12,13d'  -e "11s/$/,/" < ${LANG}_config.json
    done
echo "  ]"
echo "}"
