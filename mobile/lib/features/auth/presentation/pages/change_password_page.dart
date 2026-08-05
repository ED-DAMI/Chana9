import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  double _strength = 0;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  double _computeStrength(String password) {
    double strength = 0;
    if (password.length >= 8) strength += 0.25;
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.25;
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.25;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) strength += 0.25;
    return strength;
  }

  Color _strengthColor() {
    if (_strength <= 0.25) return Colors.red;
    if (_strength <= 0.5) return Colors.orange;
    if (_strength <= 0.75) return Colors.yellow.shade700;
    return Colors.green;
  }

  String _strengthLabel(AppLocalizations l10n) {
    if (_strength <= 0.25) return l10n.passwordWeak;
    if (_strength <= 0.5) return l10n.passwordFair;
    if (_strength <= 0.75) return l10n.passwordGood;
    return l10n.passwordStrong;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(AuthEvent.changePassword(
      currentPassword: _currentController.text,
      newPassword: _newController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.changePassword)),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            passwordSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.passwordUpdateSuccess)),
              );
              Navigator.of(context).pop();
            },
            failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: theme.colorScheme.error,
              ),
            ),
          );
        },
        builder: (context, state) {
          final isLoading = state == const AuthState.loading();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _currentController,
                    obscureText: !_showCurrent,
                    decoration: InputDecoration(
                      labelText: l10n.currentPassword,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon: IconButton(
                        icon: Icon(_showCurrent
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            setState(() => _showCurrent = !_showCurrent),
                      ),
                    ),
                    validator: (v) =>
                    v == null || v.isEmpty ? l10n.required : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _newController,
                    obscureText: !_showNew,
                    onChanged: (v) =>
                        setState(() => _strength = _computeStrength(v)),
                    decoration: InputDecoration(
                      labelText: l10n.newPassword,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _showNew ? Icons.visibility_off : Icons.visibility),
                        onPressed: () =>
                            setState(() => _showNew = !_showNew),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l10n.required;
                      if (v.length < 8) return l10n.passwordMinLength;
                      if (!v.contains(RegExp(r'[A-Z]')))
                        return l10n.passwordNeedsUppercase;
                      if (!v.contains(RegExp(r'[0-9]')))
                        return l10n.passwordNeedsNumber;
                      return null;
                    },
                  ),
                  if (_newController.text.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: _strength,
                        backgroundColor: Colors.grey.shade200,
                        color: _strengthColor(),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _strengthLabel(l10n),
                      style: TextStyle(
                          color: _strengthColor(), fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmController,
                    obscureText: !_showConfirm,
                    decoration: InputDecoration(
                      labelText: l10n.confirmPassword,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon: IconButton(
                        icon: Icon(_showConfirm
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            setState(() => _showConfirm = !_showConfirm),
                      ),
                    ),
                    validator: (v) => v != _newController.text
                        ? l10n.passwordMismatch
                        : null,
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: isLoading ? null : _submit,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                        : Text(l10n.saveChanges),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}