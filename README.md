# 79-dr-denis

- this project prediction associate dental

## How to run this project
```
docker compose up
```

# Step
- import images using <a href="https://labelstud.io/"> labelstudio </a>
    - use <a href="https://github.com/SothanaV/label-studio-docker-compose"> 01-labelstudio </a> to annotaions images 

- download annotation from labelstudio using <a href="./code/01-donwload-data.ipynb"> 01-donwload-data.ipynb </a>
- manage annotation for train, test and validataions split <a href="./code/02-manage-annotations.ipynb"> 02-manage-annotations.ipynb </a>
- training mask rcnn model <a href="./code/03-mask-rcnn.ipynb"> ./code/03-mask-rcnn.ipynb </a>