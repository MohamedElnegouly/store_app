import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_buttom.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor:
              Colors.transparent, // show the same color of scaffold
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomFormField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "product name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "description",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  onChanged: (data) {
                    price = data;
                  },
                  inputType: TextInputType.number,
                  hintText: "price",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "image",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update product',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
