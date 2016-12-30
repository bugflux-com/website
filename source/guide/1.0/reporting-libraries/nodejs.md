---
title: Node.js
description: Bugflux reporting library for Node.js.
category: Reporting libraries
layout: guide
order: 5.01
---

* [Installation and basic usage](#Installation-and-basic-usage)
 * [Options](#Options)
* [Reporting manually](#Reporting-manually)
* [Server response](#Server-response)

## Installation and basic usage

Install package by running `npm install bugflux --save`.

By default all uncaught exceptions are sent to bugflux server, the only thing you have to do is to set the default configuration:

```js
var bugflux = require('bugflux');

bugflux.setDefault({
    url: 'https://bugflux.your-domain.com/',
    project: 'Your project key',
    version: '0.1.0',
    language: 'en_US',
    environment: 'Production',
});

console.log(bugflux.default.project); // <-- Print "Your project key"
throw new Error(); // <-- Report will be sent here
```

You can disable it by setting `bugflux.options.sendUncaughtExceptions` to `false`.

### Options

All global settings can be found at `bugflux.options.*`:

* `silent` - Disable priting error message to standard error stream when uncaught exception occurs (default `false`);
* `sendUncaughtExceptions` - Enable automatic error reporting when uncaught exception occurs (default `true`).
* `strictSSL` - Force to use https protocol and verified certificates (default `true`, **we do not recommend changing this value**, but you can use it for testing or developing purposes).

## Reporting manually

You can send reports manually by calling `send` method:

```js
var fs = require('fs');
var bugflux = require('bugflux');

fs.readFile('/etc/passwd', function(err, data) {
    if(err) bugflux.send(err); // <-- Send using default settings

    // your logic
});
```

The `send` method accept `bugflux.report`, raw `Object` or `Error`:

```js
// 1. bugflux.report
var report = new bugflux.report(new Error());
// - or -
var report = new bugflux.report(new Error(), { project: 'Custom project key'});
// - or -
var report = new bugflux.report({ project: 'Awesome project key' });
    report.fill(new Error()); // <-- Fill error details (hash, name, stack_trace)

bugflux.send(report);
```

```js
// 2. Object
bugflux.send({
    url: 'https://bugflux-server/',
    project: 'Awesome project key',
    // and more... see bugflux.com/api/v1/errors.html
});
```

```js
// 3. Error
bugflux.send(new Error('test'));
```

## Server response

The `send` method accept callback as a second argument. The callback parameters are forwarded from [request method](https://github.com/request/request#super-simple-to-use).

```js
var bugflux = require('bugflux');

bugflux.send(new Error(), function(err, res, body) {
    console.log(err, res, body);
});
```