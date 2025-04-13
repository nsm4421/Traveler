part of 'p_sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    context.pop();
                  },
                  icon: const Icon(Icons.clear),
                  tooltip: 'Sign In',
                ),
                12.width,
                Text("로그인",
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    await context.read<SignInCubit>().submit();
                  },
                  icon: const Icon(Icons.login),
                )
              ],
            ),
            Form(
              key: context.read<SignInCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                        onChange: (String text) {
                          context.read<SignInCubit>().update(email: text);
                        },
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return '이메일을 입력해주세요';
                          }
                          return null;
                        },
                        inputDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "이메일 주소를 입력해주세요")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextField(
                        onChange: (String text) {
                          context.read<SignInCubit>().update(password: text);
                        },
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return '비밀번호를 입력해주세요';
                          }
                          return null;
                        },
                        obsecureText: true,
                        inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.key),
                          hintText: "비밀번호를 입력해주세요",
                        )),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
