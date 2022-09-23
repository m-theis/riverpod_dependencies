# Riverpod Dependencies

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A Brick to add common dependencies when working with riverpod and freezed

The Brick adds:
- [Riverpod](https://pub.dev/packages/riverpod) and
- [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) for state management. And
- [Build Runner](https://pub.dev/packages/build_runner) with
- [Freezed](https://pub.dev/packages/freezed) and
- [Freezed Annotation](https://pub.dev/packages/freezed_annotation) for model generation.

## How to use 🚀

First create your mason project by running `mason init` on any folder that you want.

Afterwards, add the library to your project.

```shell
mason add riverpod_dependencies
```

Now generate the files. 

You can either fill in the variables on your CLI:

```shell
mason make riverpod_dependencies --is_flutter true
```

**OR**

let CLI guide you through the process

```shell
mason make riverpod_dependencies
```

## Variables ✨

| Variable               | Description                  | Default         | Type      |
|------------------------|------------------------------|-----------------|-----------|
| `is_flutter`           | Also add flutter_riverpod    | true            | `boolean` |

## Outputs 📦

```
--is_flutter true
├── dependencies
│   ├── flutter_riverpod
│   ├── freezed_annotation
│   ├── riverpod
├── dev_dependencies
│   ├── build_runner
│   ├── freezed
└── ...
```


```
--is_flutter false
├── dependencies
│   ├── freezed_annotation
│   ├── riverpod
├── dev_dependencies
│   ├── build_runner
│   ├── freezed
└── ...
```

