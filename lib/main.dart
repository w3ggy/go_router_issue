import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_issue/sample_page.dart';
import 'package:go_router_issue/tabs_page.dart';

final routerConfig = GoRouter(
  // navigatorKey: navigatorKey,
  initialLocation: '/first',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, state, navigationShell) {
        return TabsPage(navigationShell: navigationShell, tabsCount: 2);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            StatefulShellRoute.indexedStack(
              builder: (_, state, navigationShell) {
                return TabsPage(navigationShell: navigationShell, tabsCount: 3);
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/first',
                      pageBuilder: (_, state) => MaterialPage(
                        child: SamplePage(
                          name: 'Tab page',
                          page: 1,
                          onTap: (context) {
                            context.pushNamed('SubPage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/second',
                      pageBuilder: (_, state) => MaterialPage(
                        child: SamplePage(
                          name: 'Tab page',
                          page: 2,
                          onTap: (context) {
                            context.pushNamed('SubPage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/third',
                      pageBuilder: (_, state) => MaterialPage(
                        child: SamplePage(
                          name: 'Tab page',
                          page: 3,
                          onTap: (context) {
                            context.pushNamed('SubPage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/bottom-bar-second',
              pageBuilder: (_, state) => const MaterialPage(
                child: SamplePage(name: 'Bottom bar page', page: 2),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'SubPage',
      path: '/sub-page',
      builder: (_, state) => SamplePage(
        name: 'SubPage',
        page: 1,
        onTap: (context) {
          context.pushNamed('SubFirst');
        },
      ),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (_, state, navigationShell) {
            return AnotherTabsPage(navigationShell: navigationShell, tabsCount: 3);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: 'SubFirst',
                  path: 'sub-first',
                  pageBuilder: (_, state) => const MaterialPage(
                    child: SamplePage(name: 'Inner Tab page', page: 1),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: 'SubSecond',
                  path: 'sub-second',
                  pageBuilder: (_, state) => const MaterialPage(
                    child: SamplePage(name: 'Inner Tab page', page: 2),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: 'SubThird',
                  path: 'sub-third',
                  pageBuilder: (_, state) => const MaterialPage(
                    child: SamplePage(name: 'Inner Tab page', page: 3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routerConfig,
    );
  }
}
