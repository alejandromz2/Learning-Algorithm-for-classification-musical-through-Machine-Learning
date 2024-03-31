# Learning-Algorithm-for-classification-musical-through-Deep-Learning

## Introducción
En los últimos años la demanda en la industria musical ha tenido un crecimiento exponencial producto del fenómeno de distribución musical a través de internet, esto ha ocasionado un aumento en el número de géneros musicales, artistas, instrumentos, estructuras y la base de datos relacionado a este entorno. Es por ello que se ha realizado diversos estudios sobre qué características o parámetros son relevantes para hacer clasificación y qué técnicas de aprendizaje computacional son efectivas para procesar esta información. Algunos estudios relevantes son: Seth Golub realizó una investigación aplicando 3 diferentes tipos de clasificadores a dos géneros musicales, Paul Scott elaboró un clasificador con perceptrón multinivel para cuatro géneros musicales; y Soltau entrenó una red neuronal auto-asociativa para rock, tecno, pop y clásico, todos estos estudios enfocados a Machine Learning. Estos estudios incentivan a la industria a realizar más investigación sobre cómo manejar esta gran base datos y cómo poder clasificarlas.

## Autor
* Alejandro Muñoz [LinkedIn](https://www.linkedin.com/in/alejandromz2/)
* Aaron Figeroa
* Piero Zela

## Procedimiento
### Según sus géneros musicales y sus características:
A continuación se muestra el número de canciones según su carácter o estado de ánimo (bajo o alto) y según su género musical. Estas canciones fueron usadas para entrenar y testear los diferentes métodos de clasificación que elaboramos:

| CLASE | GÉNERO MUSICAL | CARÁCTER | POBLACIÓN|
|-------|-------|--------------------|---|
| 1     | Blues | Alto: 44, Bajo: 56 |100|
| 2     | Classical | Alto: 10, Bajo: 90 |100|
| 3     | Country | Alto: 33, Bajo: 67 |100|
| 4     | Disco | Alto: 94, Bajo: 6 |100|
| 5     | Hip-hop | Alto: 70, Bajo: 30 |100|
| 6     | Jazz | Alto: 22, Bajo: 77 |100|
| 7     | Metal | Alto: 96, Bajo: 4 |100|
| 8     | Pop | Alto: 58, Bajo: 42 |100|
| 9     | Reggae | Alto: 9, Bajo: 91 |100|
| 10    | Rock | Alto: 65, Bajo: 35 |100|
|       |      |Alto Total: 501,     Bajo Total: 498| Población Total:999|

Tabla 1. Géneros musicales y sus estados de ánimo altos y bajos

### Métodos propuestos 
Se realizarán múltiples pruebas con los diferentes modelos vistos en clase y se
compara su accuracy score usando las librerías de sklearn. Además, se grafica la matriz de confusión de cada uno de los experimentos y se explicará el porqué de los resultados obtenidos mediante la teoría. Para ello se utiliza el 80 % de los datos para entrenamiento y el 20 % de los datos para testeo, de esta manera podemos estar seguro de que nuestro modelo presenta suficientes datos para no generalizar un modelo y presentar overfitting.

![image](https://github.com/alejandromz2/Learning-Algorithm-for-classification-musical-through-Deep-Learning/assets/30611516/a68977e5-3046-414f-ae6c-6ba1db4201b1)

Figura 1. Modelo de procesamiento de la señal

### Conclusiones
* Se concluye que el mejor clasificador de género musicales es Random Forrest, porque evitó con éxito overfifting con una exactitud de aproximadamente 71%. Además es recomendable usar en un clasificador los atributos relacionados a la media y desviación estándar.
* El clasificador según su carácter de canciones alcanzó una exactitud de 80% aproximadamente

### Bibliografía
● Sánchez Hidalgo, A. Multi-label Music Genre Classification. 2019. http://oa.upm.es/54437/1/TESIS_MASTER_ALVARO_SANCHEZ_HIDALGO.pdf
● Beat per Minutes calculation. https://github.com/ederwander/Beat-Track/
● Haytham Fayek. Speech Processing for Machine Learning: Filter banks, Mel-Frequency Cepstral Coefficients (MFCCs) and What’s In-Between. 2016. https://haythamfayek.com/2016/04/21/speech-processing-for-machine-learning.html
● Caparrini López, A. Pérez Molina, L. Clasificación de subgéneros de música electrónica. 2017. https://eprints.ucm.es/44672/1/TFG_2017-Clasificacion_subgeneros_musica_
electronica.pdf
● Giannakopoulos, T. 2020. Feature Extraction. https://github.com/tyiannak/pyAudioAnalysis/wiki/3.-Feature-Extraction
● Tepepa Cantero, A. Manuel Pérez, H. Nakano Miyatake, M.2018. Algoritmos de aprendizaje supervisado para la clasificación de géneros musicales caracterizados
mediante modelos estadísticos.
https://www.rcs.cic.ipn.mx/2018_147_5/Algoritmos%20de%20aprendizaje%20supervisado%20para%20la%20clasificacion%20de%20generos%20musicales%20caracterizados.pdf
● La.mathworks.com. 2020. Feature Extraction . [online] Available at:
<https://la.mathworks.com/discovery/feature-extraction.html>. https://la.mathworks.com/matlabcentral/fileexchange/45831-matlab-audio-analysis-library
● La.mathworks.com. 2020. Feature Extraction . [online] Available at:<https://la.mathworks.com/discovery/feature-extraction.html> https://la.mathworks.com/discovery/feature-extraction.html
● Giannakopoulos, T., 2020. Introduction To Audio Analysis. A MATLAB
Approach-Academic Press . 1st ed. Boston: ELSEVIER, pp.1-262

## Indicaciones
* Si desea probar el entrenamiento por usted mismo, puede descargar la base de datos utilizada en el siguiente link: https://www.kaggle.com/andradaolteanu/gtzan-dataset-music-genre-classification
* Es importante eliminar el archivo 'jazz.00054.wav' ya que se encuentra corrupto.
* Destinar un porcentaje de las canciones para el folder de canciones de entrenamiento y otro para el testeo.
* Para la clasificación binaria, especificar el directorio en el que se encuentran los folders de los que extraer atributos.
* Para Matlab, se debe ejecutar el programa 'proyecto1.m' y el entrenamiento dura 1 minuto aproximadamente.
* Para la clasificación multiclase, son 5 diferentes archivos .py para Mean, Mean+BPM, std, std+BPM y std+Mean.
* La ejecución de este programa toma al rededor de 1 hora.

## Instalación
Descarga estos archivos como un zip usando el boton verde, o clona el repositorio en tu máquina usando Git. 
Los programas tienen el formato .rvwx y requieren de los programas de Robotino View y Robotino SIM Demo, los cuales pueden ser descargados en: https://ip.festo-didactic.com/InfoPortal/Robotino/Overview/EN/index.html. 

## Información Adicional
Si tienes dudas sobre algún tema en especifico referente a este laboratorio escribeme a alejandrozevallos.218@gmail.com. 
