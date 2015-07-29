// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
library polymer.src.common.polymer_js_proxy;

import 'dart:js';
import 'package:polymer_interop/polymer_interop.dart' show Polymer, PolymerDom;
import 'js_proxy.dart';


/// Basic api for re-using the polymer js prototypes.
abstract class PolymerMixin implements JsProxy {
  JsObject _proxy;

  JsObject get jsElement {
    if (_proxy == null) {
      _proxy = new JsObject.fromBrowserObject(this);
      _proxy['__data__'] = jsProxy;
    }
    return _proxy;
  }

  void polymerCreated() {
    // Use a cache for js proxy values.
    useCache = true;
    jsElement.callMethod('originalPolymerCreatedCallback');
  }
}

class Foo extends Object with Polymer, Polymer, Polymer {}
