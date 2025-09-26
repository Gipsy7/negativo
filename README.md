# Contabizilla

Contabizilla é um aplicativo Flutter para controle de transações financeiras, inspirado nas cores e estilo do Godzilla.

## Funcionalidades

- Adição e remoção de transações
- Visualização de gráfico de gastos recentes
- Formulário customizado para novas transações
- Tema visual baseado em tons de azul escuro e neon
- Imagem do Godzilla como fundo da tela principal
- Ícone do Godzilla na AppBar
- Efeitos sonoros ao clicar nos botões

## Como usar

1. **Clone o repositório:**
   ```sh
   git clone <url-do-repositório>
   cd Negativo
   ```

2. **Adicione seus assets:**
   - Imagens em `assets/`
   - Sons em `assets/`
   - Exemplo de configuração no `pubspec.yaml`:
     ```yaml
     flutter:
       assets:
         - assets/godzilla_bg.png
         - assets/godzilla_icon.png
         - assets/audiocleaner_20250926_023254_file.mp3
     ```

3. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

4. **Execute o app:**
   ```sh
   flutter run
   ```

## Dependências principais

- [Flutter](https://flutter.dev/)
- [audioplayers](https://pub.dev/packages/audioplayers)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [intl](https://pub.dev/packages/intl)

## Personalização

- Para alterar o tema, edite o arquivo `lib/main.dart` nas configurações do `ThemeData`.
- Para trocar imagens ou sons, substitua os arquivos na pasta `assets` e atualize o `pubspec.yaml`.

## Licença

Este projeto é apenas para fins educacionais e não deve ser publicado sem autorização dos detentores dos direitos das imagens e sons utilizados.
