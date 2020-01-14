export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "{"
echo '  "embeddings": ['
for LANG in "en" "ar" "de" "es" "fr" "it" "ja" "nl" "pl" "pt" "ru" "zh"
    do
        python create_projector_data.py ${LANG}wiki_20180420_100d.pkl --tensor-file=${LANG}_emb.tsv --metadata-file=${LANG}_data.tsv --config-file=${LANG}_config.json --base-url=https://wikipedia2vec.github.io/demo/projector_files/
        if [ $LANG = "zh" ]; then
            sed -e '1,2d' -e '12,13d' < ${LANG}_config.json
        else
            sed -e '1,2d' -e '12,13d' -e "11s/$/,/" < ${LANG}_config.json
        fi
        if [ $LANG = "en" ]; then
            python create_projector_data.py ${LANG}wiki_20180420_nolg_100d.pkl --tensor-file=${LANG}_nolg_emb.tsv --metadata-file=${LANG}_nolg_data.tsv --config-file=${LANG}_nolg_config.json --model-name="English (w/o link graph)" --base-url=https://wikipedia2vec.github.io/demo/projector_files/
            sed -e '1,2d' -e '12,13d'  -e "11s/$/,/" < ${LANG}_nolg_config.json
        fi
    done
echo "  ]"
echo "}"
