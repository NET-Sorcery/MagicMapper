<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/ТвійЮзернейм/ТвійРепо/main/docs/source/img/magicmapper-w-logo.png">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/ТвійЮзернейм/ТвійРепо/main/docs/source/img/magicmapper-b-logo.png">
  <img alt="MagicMapper Logo" src="https://raw.githubusercontent.com/ТвійЮзернейм/ТвійРепо/main/docs/source/img/magicmapper-b-logo.png">
</picture>

[![CI](https://github.com/NET-Sorcery/MagicMapper/workflows/CI/badge.svg)](https://github.com/kant2002/MagicMapper/actions?query=workflow%3ACI)
[![NuGet](http://img.shields.io/nuget/vpre/MagicMapper.svg?label=NuGet)](https://www.nuget.org/packages/MagicMapper/)
[![MyGet (dev)](https://img.shields.io/myget/fastmapperdev/vpre/AutoMapper.svg?label=MyGet)](https://myget.org/feed/automapperdev/package/nuget/MagicMapper)
[![Documentation Status](https://readthedocs.org/projects/automapper/badge/?version=stable)](https://docs.automapper.org/en/stable/?badge=stable)


### What is MagicMapper?

MagicMapper is binary compatible fork with v14.0

MagicMapper is a simple little library built to solve a deceptively complex problem - getting rid of code that mapped one object to another. This type of code is rather dreary and boring to write, so why not invent a tool to do it for us?

This is the fork of main repository for AutoMapper, but there's more, which I do not fork. Please let me know in the issues if you want that:

* [Collection Extensions](https://github.com/AutoMapper/AutoMapper.Collection)
* [Expression Mapping](https://github.com/AutoMapper/AutoMapper.Extensions.ExpressionMapping)
* [EF6 Extensions](https://github.com/AutoMapper/AutoMapper.EF6)
* [IDataReader/Record Extensions](https://github.com/AutoMapper/AutoMapper.Data)
* [Enum Extensions](https://github.com/AutoMapper/AutoMapper.Extensions.EnumMapping)

### How do I get started?

First, configure MagicMapper to know what types you want to map, in the startup of your application:

```csharp
var configuration = new MapperConfiguration(cfg => 
{
    cfg.CreateMap<Foo, FooDto>();
    cfg.CreateMap<Bar, BarDto>();
});
// only during development, validate your mappings; remove it before release
#if DEBUG
configuration.AssertConfigurationIsValid();
#endif
// use DI (http://docs.automapper.org/en/latest/Dependency-injection.html) or create the mapper yourself
var mapper = configuration.CreateMapper();
```
Then in your application code, execute the mappings:

```csharp
var fooDto = mapper.Map<FooDto>(foo);
var barDto = mapper.Map<BarDto>(bar);
```

Check out the [getting started guide](https://automapper.readthedocs.io/en/latest/Getting-started.html). When you're done there, the [wiki](https://automapper.readthedocs.io/en/latest/) goes in to the nitty-gritty details. If you have questions, you can post them to [Stack Overflow](https://stackoverflow.com/questions/tagged/automapper) 

### Where can I get it?

First, [install NuGet](http://docs.nuget.org/docs/start-here/installing-nuget). Then, install [MagicMapper](https://www.nuget.org/packages/MagicMapper/) from the package manager console:

```
PM> Install-Package MagicMapper
```
Or from the .NET CLI as:
```
dotnet add package MagicMapper
```

### Do you have an issue?

First check if it's already fixed by trying the [MyGet build](https://automapper.readthedocs.io/en/latest/The-MyGet-build.html).

You might want to know exactly what [your mapping does](https://automapper.readthedocs.io/en/latest/Understanding-your-mapping.html) at runtime.

If you're still running into problems, file an issue above.

### License, etc.

This project has adopted the code of conduct defined by the Contributor Covenant to clarify expected behavior in our community.
For more information see the [.NET Foundation Code of Conduct](https://dotnetfoundation.org/code-of-conduct).

AutoMapper is Copyright &copy; 2009 [Jimmy Bogard](https://jimmybogard.com) and other contributors under the [MIT license](https://github.com/AutoMapper/AutoMapper?tab=MIT-1-ov-file#MIT-1-ov-file).

<!-- ### .NET Foundation

This project is supported by the [.NET Foundation](https://dotnetfoundation.org). -->
