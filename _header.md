# ⚡ README ⚡
---
<img alt="Terraform" src="https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg" width="200px">

![Azure](https://img.shields.io/badge/Cloud-azure-%230072C6.svg?logo=microsoftazure&logoColor=white) [![This is the link to Markdown][markdown-badge]][markdown]
[![GITHUB](https://img.shields.io/badge/github-terraform--azurerm--simple--project--template-brightgreen.svg?style=flat&logo=github)](https://github.com/rmsmatos/terraform-azurerm-simple-project-template)

[readme]: /README.md
[readme-badge]: https://img.shields.io/badge/readme-information-brightgreen
[changelog]: /CHANGELOG.md
[changelog-badge]: https://img.shields.io/badge/changelog-latest-orange
[markdown]: https://www.markdownguide.org/cheat-sheet/
[markdown-badge]:https://img.shields.io/badge/Made%20with-Mardown-yellowgreen

# Purpose
Terraform modules developed to be used on my projects.

## Branching

Use GitHub-Flow for branching code this code:

* All code on the master branch is the latest working version that can be deployed.
* To perform a new task, a new branch is created from the master branch and is explicitly named to reveal its purpose, for example, a new scheduling strategy.
* Code changes must be committed to the local branch as frequently as possible. Meanwhile, the changes must be synchronized to the branch with the same branch name on the server as frequently as possible.
* If you want to merge new code to the master branch, you must initiate a pull request to request code review.
* After the code review is passed or when the code review is ongoing, the branch must be deployed to the test environment for verification.
* If the review and verification are passed, the code must be merged to the master branch. So, the master branch is always be deployable.
* The latest release package is created from the latest code in the master branch.


## Best Practice for Terraform Module Creation
The aim of this document is to provide a best-practice framework for creating Terraform Modules.
This will help ensure all terraform modules follow a consistent format and structure.

## Module Usage
When consuming a Terraform module the source should always be versioned.
Where possible all code should be locked to a version to prevent issues in future.
A conscious effort should be made to bring these versions up-to date on a regular basis.

### Module Structure

Each module must obey to the following structure.

```
├── example
│   ├── foo
│   │   └── main.tf
│   └── test
│       ├── backend.tf
│       ├── main.tf
│       └── provider.tf
├── .editorconfig
├── .gitattributes
├── .terraform-docs.yml
├── _footer.md
├── _header.md
├── CHANGELOG.md
├── LICENSE.md
├── locals.tf
├── main.tf
├── NOTICE.md
├── outputs.tf
├── README.md
└── variables.tf
```

* .editorconfig - VSCode settings
* .gitattributes - A gitattributes file is a simple text file that gives attributes to pathnames
* .terraform-docs.yml - Terraform-docs configuration file in yaml format
* _footer.md - Footer file to be added to README.md by terraform-docs
* _header.md - Header file to be added to README.md by terraform-docs
* README.md - Documentation and example usage
* CHANGELOG.md - Documentation changes
* LICENSE.md - License
* NOTICE.md - Important information
* main.tf - Module code
* variables.tf - Input variables
* output.tf - Output variables


### Providers
Terraform providers should not be specified within a module.
Instead use the required_provider option, all providers should also include a minimum version.

## Azure Terraform Modules
This repository contains the standard modules for Azure

## Release Expectations
We intend to use semantic versioning for the modules in this repository. This means that each module folder will have a release tag similar to v0.0.1. If any modules are made completely incompatible, they require a major version update and we will note in release notes.

Each module should have it's own usage documentation in the folder. The module folder should also include a CHANGELOG.md for that module.

We do not anticipate retrofitting patches to older MINOR versions. If we are currently on v1.2.0 and a bug is found that was introduced in v1.1.0 we will patch to v1.2.1 (and there will not be a v1.1.1). Pull requests always accepted if you have a need to patch older releases.

## Version Differences
* MAJOR: Changing versions here will require changes to your module parameters
  * Could have new required parameters or changes to defaults that could affect implementations
  * May remove certain parameters
* MINOR: Changing minor versions should have parameter backwards compatibility
  * Required parameters should not change between MINOR versions
  * Optional parameters may change or there may be new optional parameters
  * We will not remove optional parameters between MINOR releases, a MAJOR is required
  * Defaults on optional parameters may change between MINOR versions, including default versions
  * Change Log will outline expected differences between Minor releases
* PATCH: Changing minor defaults or logic fixes
  * Bugs that fix behavior or adjust "constant change" issues in terraform runs
  * Typos could be fixed with patch if it affects behavior of the terraform module
  * Fixes to older supported features of the module that broke with MINOR functionality changes
  * README and USAGE documentation changes may trigger a PATCH change and should be documented in CHANGELOG