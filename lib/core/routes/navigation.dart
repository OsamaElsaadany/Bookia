import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushto(BuildContext context, String route) {
  context.push(route);
}

pushrplc(BuildContext context, String route) {
  context.pushReplacement(route);
}

pop(BuildContext context) {
  context.pop();
}

void pushandrm(BuildContext context, String route, {Object? extra}) {
  GoRouter.of(context).pushReplacement(route, extra: extra);
}
