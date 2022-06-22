# TheoryofML-grp2

Next meeting Wednesday 6/22, 9 PM EST

Zoom link:
https://us05web.zoom.us/j/86284239210?pwd=cXFKMUJ3R1hsbHZ0VFpvU0k1VFJSQT09


## Analysis Ideas:




## Data Source Ideas


### Michael 

_Protein binding site classification_

Type: Binary classification

https://www.kaggle.com/datasets/hobako1993/sp1-factor-binding-sites-on-chromosome1

Using a 14-nucleotide sequence, determine whether the DNA region is a binding site for sp1. Likely needs to be split into 14 categorical features, that then need to be one-hot encoded (but how do we keep the ordering then? Similar to week 2 ideas with basis expansions with neighboring nucleotides? Maybe this would get learned regardless without)

_Skin cancer HAM10000_

Type: Image classification

Link: https://www.kaggle.com/datasets/kmader/skin-cancer-mnist-ham10000

This is probably too well-studied, but seems like an interesting way to combine images with structured data for classification (sex, age, skin area, etc.)

_Cartoon image classification_

Type: multiclass image classification

Link: https://www.kaggle.com/datasets/volkandl/cartoon-classification

Determination of cartoon image source (10 total) based on image data. Poking through some of the folders, it looks like many of the frames given might be duplicates or very similar, so judging performance might be difficult.





### Isaac

_Breast cancer classifaction in histopathology images_

Type: binary image classification

Link: https://www.kaggle.com/datasets/paultimothymooney/breast-histopathology-images

High res images of breast biopsies cropped into smaller patches with corresponding cancer/no cancer label. Not sure how professor will view it since it's a kaggle competion with about 100 notebooks.

_Pathologic voice disorder classification_

Type: multiclass or binary audio classification

Link: https://www.physionet.org/content/voiced/1.0.0/

Time-series microphone recordings of subjects with voice diorders and without voice disorders. 

_Agricultural crop classification_

Type: muticlass image classification

Link: https://mlhub.earth/data/idiv_asia_crop_type

Satellite images containing different crops with corresponding ground truth labels. Dataset was created to analyze things like water resource allocation and food security.

### Nicholas 

https://www.kaggle.com/datasets/prasertk/inflation-interest-and-unemployment-rate

50 years+ of historical inflaction, interest and unemployment rates by country

Has a variety of different explanatory variables related to inflation across countries, predicting inflation rate categories could be interesting.

https://www.kaggle.com/datasets/marikastewart/employee-turnover

This database is from a large US company (no name given for privacy reasons). The management department is worried about the relatively high turnover. They want to find ways to reduce the number of employees leaving the company and to better understand the situation, which employees are more likely to leave, and why.

https://www.kaggle.com/datasets/mrisdal/union-membership-coverage

The United States Department of Labor tells us that "Labor Day, the first Monday in September, is a creation of the labor movement and is dedicated to the social and economic achievements of American workers. It constitutes a yearly national tribute to the contributions workers have made to the strength, prosperity, and well-being of our country."

This database of state-level union membership and coverage from 1983 to 2015 was originally compiled by Barry Hirsch (Andrew Young School of Policy Studies, Georgia State University) and David Macpherson (Department of Economics, Trinity University). The database, available at unionstats.com provides private and public sector labor union membership, coverage, and density estimates compiled from the monthly household Current Population Survey (CPS) using BLS methods.

Use of this data requires citation of the following paper which also includes a description of how the database was created: Barry T. Hirsch and David A. Macpherson, "Union Membership and Coverage Database from the Current Population Survey: Note," Industrial and Labor Relations Review, Vol. 56, No. 2, January 2003, pp. 349-54. (PDF).
