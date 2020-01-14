for LANG in "ar" "de" "en" "es" "fr" "it" "ja" "nl" "pl" "pt" "ru" "zh"
    do
        curl -o - https://wikipedia2vec.s3-ap-northeast-1.amazonaws.com/models/$LANG/2018-04-20/${LANG}wiki_20180420_100d.pkl.bz2 | bunzip2 > ${LANG}wiki_20180420_100d.pkl
    done
curl -o - https://wikipedia2vec.s3-ap-northeast-1.amazonaws.com/models/en/2018-04-20/enwiki_20180420_nolg_100d.pkl.bz2 | bunzip2 > enwiki_20180420_nolg_100d.pkl
