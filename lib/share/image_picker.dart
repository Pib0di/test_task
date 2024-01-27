import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> showImageSourceDialog(BuildContext context) async {
  final source = await showDialog<ImageSource>(
    context: context,
    builder: (context) => const ImagePickerDialog(),
  );

  if (source == null) {
    return null;
  }

  final pickedFile = await ImagePicker().pickImage(source: source);

  return pickedFile;
}

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Выберите фото',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.only(
        top: 4,
        bottom: 8,
        left: 16,
        right: 16,
      ),
      actions: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    minimumSize:
                        const MaterialStatePropertyAll<Size?>(Size.zero),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.green),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
              child: const Text(
                'Камера',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    minimumSize:
                        const MaterialStatePropertyAll<Size?>(Size.zero),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.green),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
              child: const Text(
                'Галлерея',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
