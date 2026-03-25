python -m venv imaging-env
.\imaging-env\Scripts\activate
pip install -r requirements/imaging.txt
python -m ipykernel install --user --name imaging-env --display-name "Python (Imaging)"
deactivate

python -m venv notebook-env
.\notebook-env\Scripts\activate
pip install -r requirements/notebook.txt