import 'dart:html';

import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:test/test.dart';

main() {
  setClientConfiguration();

  group('ReactDom.createPortal', () {
    group('creates a portal ReactNode that renders correctly', () {
      Element mountNode;

      setUp(() {
        mountNode = new DivElement();
      });

      tearDown(() {
        react_dom.unmountComponentAtNode(mountNode);
      });

      test('with simple children', () {
        final portalTargetNode = new Element.div();
        final portal = ReactDom.createPortal('foo', portalTargetNode);
        react_dom.render(portal, mountNode);

        expect(portalTargetNode.text, contains('foo'));
      });

      test('with nested list children', () {
        final portalTargetNode = new Element.div();
        final portal = ReactDom.createPortal([
          ['foo'],
          [
            'bar',
            ['baz']
          ]
        ], portalTargetNode);
        react_dom.render(portal, mountNode);

        expect(portalTargetNode.text, contains('foobarbaz'));
      });
    });
  });
}
