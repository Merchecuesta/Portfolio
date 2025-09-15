# Proyecto de Predicción de Churn

## Descripción

Este proyecto tiene como objetivo predecir la probabilidad de que un cliente abandone (churn) una empresa, utilizando técnicas de machine learning. Se desarrolla un modelo predictivo basado en algoritmos supervisados como CatBoost, XGBoost y LightGBM, y se evalúan sus resultados para seleccionar la mejor estrategia.

Además, se realiza un análisis de coste-beneficio de campañas de retención y segmentación de clientes para maximizar la eficiencia de las acciones de marketing.

## Uso

1. **Preparación de datos:** Cargar y transformar el dataset original en la carpeta `data/raw/`, limpiar y guardar en `data/processed/`.
2. **Entrenamiento:** Utilizar los notebooks para entrenar y validar modelos.
3. **Predicción:** Cargar un archivo CSV con datos de clientes para obtener la predicción de churn.
4. **Evaluación:** Consultar métricas como Recall, AUC-ROC, Precision y F1-Score para comparar modelos.
5. **Simulación económica:** Evaluar la rentabilidad de campañas de retención basadas en las predicciones.

## Estructura del Proyecto

```
|-- nombre_proyecto_final_ML
    |-- data
    |   |-- raw
    |        |-- dataset.csv
    |        |-- ...
    |   |-- processed
    |   |-- train
    |   |-- test
    |
    |-- notebooks
    |   |-- 01_Fuentes.ipynb
    |   |-- 02_LimpiezaEDA.ipynb
    |   |-- 03_Entrenamiento_Evaluacion.ipynb
    |   |-- ...
    |
    |-- src
    |   |-- data_processing.py
    |   |-- training.py
    |   |-- evaluation.py
    |   |-- ...
    |
    |-- models
    |   |-- trained_model.pkl
    |   |-- ...
    |
    |-- app_streamlit
    |   |-- app.py
    |   |-- requirements.txt
    |   |-- ...
    |
    |-- docs
    |   |-- negocio.ppt
    |   |-- ds.ppt
    |   |-- memoria.md
    |   |-- ...
    |
    |
    |-- README.md

```
## Requisitos

- Python 3.x
- pandas
- numpy
- scikit-learn
- catboost
- xgboost
- lightgbm
- streamlit
- seaborn
- matplotlib
- joblib

##  Resultados Clave

CatBoost ofrece el mejor balance general con un AUC-ROC de 0.852.

XGBoost maximiza el recall (0.82), ideal para detectar clientes en riesgo.

LightGBM ofrece eficiencia y buen rendimiento.

Las campañas segmentadas optimizan costes y mejoran el ROI.

## Contacto
Para dudas o colaboraciones, contactar a [mercedescuestamunoz@gmail.com].