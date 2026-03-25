# Image registration and preprocessing

Personal sandbox for experimenting with **medical image registration**, **preprocessing**, and related tooling (PyTorch-based stacks, ANTs, SimpleITK, NIfTI I/O, and notebooks).

## Layout

| Path | Role |
|------|------|
| `notebooks/` | Jupyter experiments (e.g. registration workflows) |
| `requirements/imaging.txt` | Heavy compute: PyTorch, MONAI, TorchIO, ANTsPy, SimpleITK, nibabel, scientific stack, `ipykernel` |
| `requirements/notebook.txt` | Jupyter UI and light plotting: Notebook / JupyterLab, widgets, matplotlib, seaborn, pandas |
| `main.py` | Minimal package entry point (placeholder) |
| `pyproject.toml` | Project metadata; Python **3.12+** (`requires-python`) |
| `requirements.txt` | Flat dependency list at repo root (optional; not used by `setup_envs.ps1`) |

## Two virtual environments

1. **`imaging-env`** — ML and imaging libraries; registered as the Jupyter kernel **Python (Imaging)**.
2. **`notebook-env`** — Run Jupyter from here; use the **Python (Imaging)** kernel inside notebooks that need the heavy stack.

This keeps the notebook server lightweight while still allowing full imaging dependencies in the kernel.

## Quick setup (Windows, PowerShell)

From the repository root:

```powershell
.\setup_envs.ps1
```

The script creates `imaging-env` and `notebook-env`, installs from `requirements/imaging.txt` and `requirements/notebook.txt`, and registers the imaging kernel.

If script execution is blocked, run once in the same session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## Manual setup (same result as the script)

### 1. Imaging environment + Jupyter kernel

```powershell
python -m venv imaging-env
.\imaging-env\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements/imaging.txt
python -m ipykernel install --user --name imaging-env --display-name "Python (Imaging)"
deactivate
```

### 2. Notebook environment

Deactivate any active venv first, then:

```powershell
python -m venv notebook-env
.\notebook-env\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements/notebook.txt
```

### 3. Start Jupyter

With `notebook-env` activated:

```powershell
jupyter lab
# or: jupyter notebook
```

In the notebook UI, choose the kernel **Python (Imaging)** when you need the imaging / registration stack.

## Optional: install the local package

```powershell
pip install -e .
```

Dependencies for experiments still come from the `requirements/*.txt` files above; `pyproject.toml` does not pin them.
