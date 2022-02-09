import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _emailEc = TextEditingController();
  final _passwordEc = TextEditingController();
  
  @override
  void dispose() {
    _nameEc.dispose();
    _emailEc.dispose();
    _passwordEc.dispose();
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(elevation: 0,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cadastro",
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        Text(
                          'Preencha os campos abaixo para criar o seu cadastro.',
                          style: context.textTheme.bodyText1,),
                        const SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(
                          label: 'Nome*',
                          controller: _nameEc,
                          validator: Validatorless.required('Nome Obrigatório'),
                        ),
                        const SizedBox(height: 30,),
                        VakinhaTextformfield(
                          label: 'E-mail*',
                          controller: _emailEc,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('Email inválido')
                          ]),
                        ),
                        const SizedBox(height: 30,),
                        VakinhaTextformfield(
                          label: 'Senha*',
                          controller: _passwordEc,
                          obscureText: true,
                          validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres')
                          ]),
                        ),
                        const SizedBox(height: 30,),
                        VakinhaTextformfield(
                          label: 'Confirmar Senha*',
                          obscureText: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('Confirma senha obrigatória'),
                            Validatorless.compare(_passwordEc, 'Senha diferente de confirma senha'),
                          ]
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: VakinhaButton(
                            width: context.width,
                            label: 'CADASTRAR', onPressed: (){
                              final formValid = _formKey.currentState?.validate() ?? false;
                              if(formValid){
                                controller.register(
                                  name: _nameEc.text,
                                  email: _emailEc.text,
                                  password: _passwordEc.text);
                              }
                            }
                          ),
                        ),                        
                      ],
                    ),
                  ),
                ),
        )
      )
          
    );
      
    
  }
}