# isoc

> Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/docs/pdk/latest/pdk_generating_modules.html .

Добро пожаловать в новый модуль. Короткий обзор сгенерированных частей Вы найдете в документации по PDK https://puppet.com/docs/pdk/latest/pdk_generating_modules.html. 

> The README template below provides a starting point with details about what information to include in your README.

Данный шаблон дает начальную точку об информации, какую включать в этот README.




#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with isoc](#setup)
    * [What isoc affects](#what-isoc-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with isoc](#beginning-with-isoc)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Данный модуль предназначен для развертывания компонентов isoc в организации.


## Setup

### What isoc affects **OPTIONAL**

> If it's obvious what your module touches, you can skip this section. For example, folks can probably figure out that your mysql_instance module affects their MySQL instances.
>
> If there's more that they should know about, though, this is the place to mention:
>
> * Files, packages, services, or operations that the module will alter, impact, or execute.
> * Dependencies that your module automatically installs.
> * Warnings or other important notices.

### Setup Requirements **OPTIONAL**

Для работы данного модуля должна быть подключена возможность использования экспортируемых ресурсов ( [Exported resources](https://puppet.com/docs/puppet/latest/lang_exported.html) )

Данный модуль использует внешние модули, у внешних модулей есть дополнительные зависимости, например, для модуля [telegraf](https://github.com/voxpupuli/puppet-telegraf#setup), необходима установка дополнительного gem `toml-rb`

> If your module requires anything extra before setting up (pluginsync enabled, another module, etc.), mention it here.
>
> If your most recent release breaks compatibility or requires particular steps for upgrading, you might want to include an additional "Upgrading" section here.

### Beginning with isoc

> The very basic steps needed for a user to get the module up and running. This can include setup steps, if necessary, or it can be an example of the most basic use of the module.

## Usage

> Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

## Reference
Смотрите [REFERENCE.md](REFERENCE.md)

Эта секция считается устаревшей. Рекомендуется использовать комментарии в классах и ресурсах для описания параметров, которые можно использовать при использовании данного модуля. Для генерации файла REFERENCE.md, нужно использовать `puppet string generate --format markdown`

Документация по использованию Puppet Strins:
 - [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html)
 - [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

Для примера, смотрите класс `isoc::postgres`

> This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

> If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.
> 
> For each element (class, defined type, function, and so on), list:
> 
>   * The data type, if applicable.
>   * A description of what the element does.
>   * Valid values, if the data type doesn't make it obvious.
>   * Default value, if any.
> 
> For example:
> 
 ```
 ### `pet::cat`
 
 #### Parameters
 
 ##### `meow`
 
 Enables vocalization in your cat. Valid options: 'string'.
 
 Default: 'medium-loud'.
 ```

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

При разработке данного модуля, пользуйтесь [общими рекомендациями](https://puppet.com/docs/puppet/latest/bgtm.html) от Puppetlabs.
> In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
