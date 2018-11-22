
if [ "$1" == "cluster" ]; then
  export RUN_MODE="CLUSTER"
elif [ "$1" == "client" ]; then
  export RUN_MODE="CLIENT"
fi

archives=archives/tokenizers.zip,archives/corpora.zip,archives/sentiment.zip
eggs=eggs/nltk-3.4-py2.7.egg,eggs/six-1.11.0-py2.7.egg,eggs/textblob-0.15.2-py2.7.egg
pyfiles=src/load.py

spark-submit --master yarn --deploy-mode $1 --driver-memory 4G --num-executors 5 --executor-memory 4G --executor-cores 5 --py-files $pyfiles,$eggs --archives $archives $2


# spark-submit --master yarn --deploy-mode client --driver-memory 4G --num-executors 5 --executor-memory 4G --executor-cores 5 --py-files lib/load-0.1-py3.6.egg basic_metrics.py

# spark-submit --master yarn --deploy-mode client --driver-memory 4G --num-executors 5 --executor-memory 4G --executor-cores 5 --conf spark.submit.pyFile=src/imports.zip  basic_metrics.py
# --conf spark.submit.pyFile
