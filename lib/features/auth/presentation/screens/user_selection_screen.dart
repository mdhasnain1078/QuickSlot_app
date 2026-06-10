import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickslot/features/auth/presentation/providers/auth_provider.dart';
class UserSelectionScreen extends ConsumerWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F46E5), Color(0xFF312E81)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sports_tennis_rounded, size: 80, color: Colors.white),
                const SizedBox(height: 24),
                Text(
                  'Who is playing today?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                ),
                const SizedBox(height: 48),
                ...dummyUsers.map((user) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () async {
                          await ref.read(authProvider.notifier).login(user);
                          if (context.mounted) {
                            context.go('/venues');
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                  user.name[user.name.length - 1], // Extracts '1', '2', '3' from "Test User X"
                                  style: const TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                user.name,
                                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              const Icon(Icons.chevron_right_rounded, color: Colors.white70),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
