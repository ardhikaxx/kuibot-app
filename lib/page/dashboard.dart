import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _robotStatus = false;
  double _xDirection = 0;
  double _yDirection = 0;
  final bool _isConnected = true;
  final Color _accentColor = const Color(0xFFB51D2A);
  final Color _darkColor = const Color(0xFF121212);
  final Color _darkerColor = const Color(0xFF0A0A0A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkerColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [_darkColor, _darkerColor],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: _accentColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: _accentColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.memory_rounded,
                            color: _accentColor,
                            size: 35,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'kuibot',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'IchijiOne',
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: _accentColor.withOpacity(0.5),
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'CONTROL PANEL v1.0.0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [_darkColor, _darkerColor],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _accentColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: _accentColor.withOpacity(0.05),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SYSTEM STATUS',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[600],
                                letterSpacing: 1.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                gradient: _isConnected
                                    ? LinearGradient(
                                        colors: [
                                          _accentColor.withOpacity(0.8),
                                          _accentColor.withOpacity(0.6),
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.grey[800]!,
                                          Colors.grey[900]!,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: _isConnected
                                        ? _accentColor.withOpacity(0.3)
                                        : Colors.grey.withOpacity(0.1),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _isConnected ? Icons.link : Icons.link_off,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _isConnected ? 'CONNECTED' : 'DISCONNECTED',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 130,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [_darkColor, _darkerColor],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                            ),
                            LiteRollingSwitch(
                              width: 130,
                              value: _robotStatus,
                              textOnColor: Colors.white,
                              textOffColor: Colors.white,
                              colorOn: _accentColor,
                              colorOff: Colors.grey[800]!,
                              iconOn: Icons.power_settings_new,
                              iconOff: Icons.power_settings_new,
                              animationDuration: const Duration(
                                milliseconds: 400,
                              ),
                              onChanged: (bool state) {
                                setState(() {
                                  _robotStatus = state;
                                });
                              },
                              onTap: () {},
                              onDoubleTap: () {},
                              onSwipe: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [_darkColor, _darkerColor],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _accentColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: _accentColor.withOpacity(0.05),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.gamepad, color: _accentColor, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'MOVEMENT CONTROL',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[600],
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer glow effect
                            Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: _accentColor.withOpacity(0.1),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            // Base circle
                            Container(
                              width: 240,
                              height: 240,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    _darkColor.withOpacity(0.8),
                                    _darkerColor.withOpacity(0.9),
                                  ],
                                  stops: const [0.1, 1.0],
                                ),
                                border: Border.all(
                                  color: _accentColor.withOpacity(0.2),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            // Inner grid pattern
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _accentColor.withOpacity(0.1),
                                  width: 0.5,
                                ),
                              ),
                              child: CustomPaint(
                                painter: _CircleGridPainter(
                                  accentColor: _accentColor,
                                ),
                              ),
                            ),
                            // Joystick
                            Joystick(
                              mode: JoystickMode.all,
                              listener: (details) {
                                setState(() {
                                  _xDirection = details.x;
                                  _yDirection = details.y;
                                });
                              },
                              base: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      _accentColor.withOpacity(0.3),
                                      _accentColor.withOpacity(0.5),
                                    ],
                                  ),
                                  border: Border.all(
                                    color: _accentColor.withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _accentColor.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                              ),
                              stick: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      _accentColor,
                                      _accentColor.withOpacity(0.8),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _accentColor.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Axis indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _FuturisticDirectionIndicator(
                              value: _xDirection,
                              label: 'X-AXIS',
                              activeColor: _accentColor,
                            ),
                            _FuturisticDirectionIndicator(
                              value: _yDirection,
                              label: 'Y-AXIS',
                              activeColor: _accentColor.withOpacity(0.8),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Additional controls
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(0.2),
                            border: Border.all(
                              color: _accentColor.withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _ControlButton(
                                icon: Icons.autorenew,
                                label: 'Calibrate',
                                onPressed: () {},
                                accentColor: _accentColor,
                              ),
                              _ControlButton(
                                icon: Icons.settings,
                                label: 'Settings',
                                onPressed: () {},
                                accentColor: _accentColor,
                              ),
                              _ControlButton(
                                icon: Icons.smart_button,
                                label: 'Mode Auto',
                                onPressed: () {},
                                accentColor: _accentColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FuturisticDirectionIndicator extends StatelessWidget {
  final double value;
  final String label;
  final Color activeColor;

  const _FuturisticDirectionIndicator({
    required this.value,
    required this.label,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 120,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black.withOpacity(0.3),
            border: Border.all(color: const Color(0xFFB51D2A).withOpacity(0.1)),
          ),
          child: Stack(
            children: [
              // Background track
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.withOpacity(0.1),
                      Colors.grey.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
              // Active indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: (value * 50) + 50,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        activeColor.withOpacity(0.8),
                        activeColor.withOpacity(0.4),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: activeColor.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: activeColor,
            shadows: [
              Shadow(blurRadius: 10, color: activeColor.withOpacity(0.5)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color accentColor;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[900]!, Colors.black],
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(icon, size: 20, color: accentColor),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
      ],
    );
  }
}

class _CircleGridPainter extends CustomPainter {
  final Color accentColor;

  const _CircleGridPainter({this.accentColor = const Color(0xFFB51D2A)});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..color = accentColor.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    // Draw concentric circles
    for (double i = 1; i <= 4; i++) {
      canvas.drawCircle(center, radius * i / 4, paint);
    }

    // Draw cross lines
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), paint);
    canvas.drawLine(
      Offset(center.dx, 0),
      Offset(center.dx, size.height),
      paint,
    );

    // Draw diagonal lines
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
