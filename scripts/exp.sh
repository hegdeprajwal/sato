# feature importance
python3 feature_importance.py  --model_type=single --model_path=sherlock_None.pt
python3 feature_importance.py  --model_type=single --model_path=all_None.pt --topic=num-directstr_thr-0_tn-400

python3 feature_importance.py  --model_type=CRF --model_path=CRF_pre.pt 
python3 feature_importance.py  --model_type=CRF --model_path=CRF+LDA_pre.pt --topic=num-directstr_thr-0_tn-400


cd $BASEPATH/model
python3 train_CRF_LC.py -c params/crf_configs/CRF.txt --multi_col_only=true --comment=path 
python3 train_CRF_LC.py -c params/crf_configs/CRF+LDA.txt --multi_col_only=true --comment=pathL 

python3 train_CRF_LC.py -c params/crf_configs/CRF.txt  --comment=path 
python3 train_CRF_LC.py -c params/crf_configs/CRF+LDA.txt  --comment=pathL 

cd $BASEPATH/scripts
python3 per_type.py
