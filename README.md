# Getting started

The repository
[ComputerLab](https://github.com/hivert/ComputerAlgebra) defines a
virtual environment to work on the material for the course «Algorithms
for Formal Calculus, Combinatoric and Information Theory», of the
Master 1 Informatique, to be
deployed on computational services like mydocker or on your own
machine. If facilitates in particular the installation of all the
required artifacts

- software: `JupyterLab`,  `SageMath`, ...
  (see the file <a href="environment.yml">environment.yml</a>)

### Online service myDocker@Paris-Saclay

Paris-Saclay provides an online virtual environment service
[myDocker@Paris-Saclay](https://mydocker.universite-paris-saclay.fr/)
where all required artifacts are available.

1.  Access the <a href="https://mydocker.universite-paris-saclay.fr/shell/join/gkctIyHvdZkofetGeMju" target="_blank">course environment on myDocker@Paris-Saclay</a>.
2.  For authentication, type `Saclay` to choose Université Paris
    Saclay, and use your usual university credentials (Adonis).
3.  Click "Demander un environnement".
4.  Open a terminal (Fichier -> Nouveau -> Terminal).
5.  Download the «computer lab»:

        git clone https://github.com/hivert/ComputerAlgebra

## Using on your own machine

If you wish to work on your own machine, here are instructions to
install this environment. They assume that you have access to a
terminal and the version control system `git`, and that you are
somewhat familiar with them. The instructions should be valid on any
platform supported by conda, including Windows, MacOS, Linux. They are
provided as is, without technical support. Suggestions welcome.

### With miniconda (ou micromamba, ...)

1.  Install the [conda](https://conda.io) package manager. We
    recommend using the [Miniforge
    installer](https://conda-forge.org/download/).

5.  Download the «computer lab»:

        git clone https://github.com/hivert/ComputerAlgebra

3.  Install the required software:

        cd ComputerAlgebra
	mamba env create

4.  Proceed as above on mydocker starting from 6.

#### With Docker

This assumes that you are familiar with docker. A docker image of the
virtual environment is available from the following
[Container Registry](https://gitlab-research.centralesupelec.fr/M2MathAgregation/ComputerLab/container_registry):

	gitlab-research.centralesupelec.fr:4567/m2mathagregation/computerlab/image:latest
