import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdv_api/controller/usuario/cad_usuario_controller.dart';

class CadUsuarioView extends StatelessWidget {
  CadUsuarioView({super.key});

  final cadUserCtl = Get.put(CadUsuarioController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: cadUserCtl.formKey,
        child: GetX(
          global: false,
          init: cadUserCtl,
          builder: (cadUserCtl) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cadastro de Usuário'),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Escolha uma opção',
                    content: Column(
                      children: [
                        ListTile(
                          title: const Text('Câmera'),
                          onTap: () {
                            cadUserCtl.setImagem(ImageSource.camera);
                            Get.back();
                          },
                        ),
                        ListTile(
                          title: const Text('Galeria'),
                          onTap: () {
                            cadUserCtl.setImagem(ImageSource.gallery);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: cadUserCtl.fotoController.value.isEmpty
                          ? null
                          : MemoryImage(cadUserCtl.fotoController.value),
                      child: cadUserCtl.fotoController.value.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 50,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: cadUserCtl.nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cadUserCtl.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cadUserCtl.senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe a senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cadUserCtl.senhaConfirmaController,
                decoration: const InputDecoration(
                  labelText: 'Confirmação de Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe a senha';
                  }
                  if (value != cadUserCtl.senhaController.text) {
                    return 'As senhas não conferem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: cadUserCtl.inserir,
                    child: const Text('Salvar'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300,
                    ),
                    onPressed: cadUserCtl.excluir,
                    child: const Text('Excluir'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade300,
                    ),
                    onPressed: () {},
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
