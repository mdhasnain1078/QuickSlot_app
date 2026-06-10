import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickslot/features/auth/presentation/screens/splash_screen.dart';
import 'package:quickslot/features/auth/presentation/screens/user_selection_screen.dart';
import 'package:quickslot/features/bookings/presentation/screens/booking_success_screen.dart';
import 'package:quickslot/features/bookings/presentation/screens/my_bookings_screen.dart';
import 'package:quickslot/features/venues/presentation/screens/venue_detail_screen.dart';
import 'package:quickslot/features/venues/presentation/screens/venue_list_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const UserSelectionScreen(),
    ),
    GoRoute(
      path: '/venues',
      builder: (context, state) => const VenueListScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final venueId = state.pathParameters['id']!;
            return VenueDetailScreen(venueId: venueId);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/bookings',
      builder: (context, state) => const MyBookingsScreen(),
    ),
    GoRoute(
      path: '/booking-success',
      builder: (context, state) => const BookingSuccessScreen(),
    ),
  ],
);
