import 'package:flutter/material.dart';

class EmptyWidget extends StatefulWidget {
  final String title;
  final String message;
  final String imagePath;
  final VoidCallback? onTap;
  const EmptyWidget({
    super.key,
    required this.title,
    required this.message,
    required this.imagePath,
    this.onTap,
  });

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _vibrantController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _vibrantController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.02, 0.00),
    ).animate(_vibrantController);
  }

  @override
  void dispose() {
    _vibrantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: SlideTransition(
                  position: _animation,
                  child: Image.asset(
                    widget.imagePath,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
