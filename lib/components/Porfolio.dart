import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PorfolioComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildSection(
                icon: Icons.person,
                description:
                    'Soy un apasionado desarrollador web y arquitecto de software con experiencia en desarrollo desde que comencé a aprender en 2019. Tengo experiencia en la gestión de horarios y tareas para obtener la máxima productividad. Me especializo en frameworks web y back-end como React.js, Next.js, Node.js, TypeScript, JavaScript, MongoDB, Firebase, entre otros. He tenido éxito en proyectos como freelancer, donde he demostrado habilidades técnicas y soluciones efectivas. Actualmente estudio desarrollo de software en el Instituto tecnológico de las Américas (ITLA). Mi compromiso con la excelencia y el aprendizaje continuo me asegura mantenerme al día con las últimas tendencias y, sobre todo, aplicar las mejores prácticas para entregar una excelente experiencia al usuario.',
                name: 'Morphy De oleo Martinez',
                title: 'About',
              ),
              SizedBox(height: 20),
              _buildSection(
                title: 'Experiencia',
                icon: Icons.work,
                description:
                    'Como desarrollador web y arquitecto de software con experiencia como freelancer, he liderado numerosos proyectos resolviendo problemas complejos de programación y entregando soluciones efectivas. Mi conocimiento abarca una amplia gama de tecnologías, incluyendo JavaScript, Node.js, TypeScript y .NET, junto con frameworks como React.js, Next.js y ASP.NET. Con habilidades en integración de métodos de pago y gestión de proyectos, estoy preparado para agregar valor inmediato a cualquier equipo de desarrollo.',
              ),
              SizedBox(height: 20),
              _buildSection(
                title: 'Skills',
                icon: Icons.code,
                description:
                    'JavaScript, Node, TypeScript,: React.js, Next.js, ASP.NET, Angular,flutter,React native,kotlin',
              ),
              SizedBox(height: 20),
              _buildSection(
                title: 'Proyectos',
                icon: Icons.folder,
                description:
                    'Muestra una lista de tus proyectos destacados con una breve descripción de cada uno.',
              ),
              SizedBox(height: 20),
              _buildSection(
                title: 'Visita mi  Portafolio Web',
                icon: Icons.link,
                description:
                    'https://morphy-porfolio.vercel.app',
                isLink: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String description,
    bool isLink = false,
    Widget? avatar,
    String? name,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null) ...[
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/photo.jpg'),
                ),
                SizedBox(height: 8),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        isLink
            ? GestureDetector(
                onTap: () {
                  launch(description); // Esto abrirá el enlace en el navegador predeterminado
                },
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            : Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
      ],
    );
  }
}
