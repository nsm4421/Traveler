part of 'p_sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _handleSubmit() async {
    FocusScope.of(context).unfocus();
    await context.read<SignUpCubit>().submit();
  }

  void _handlePop() {
    context.read<AuthenticationBloc>().add(InitAuthenticationStateEvent(
        status: Status.initial, errorMessage: '', isAuth: false));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showSnackBar(state.errorMessage);
          Timer(1.durationInSec, () {
            if (context.mounted) {
              context.read<SignUpCubit>().update(status: Status.initial);
            }
          });
        } else if (state.status == Status.success) {
          context.showSnackBar('회원가입 성공!');
        }
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
        return LoadingOverLayWidget(
          isLoading: state.status != Status.initial,
          loadingWidget: const Center(child: CircularProgressIndicator()),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              leading: IconButton(
                onPressed: _handlePop,
                icon: const Icon(Icons.clear),
                tooltip: 'Sign Up',
              ),
              title: Text("회원가입",
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  onPressed: _handleSubmit,
                  icon: const Icon(Icons.add_box_outlined),
                )
              ],
            ),
            body: const SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: BasicSignUpFormFragment(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: SelectBornAtWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 8, bottom: 24, left: 12, right: 12),
                    child: SelectProfileImageWidget(),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
