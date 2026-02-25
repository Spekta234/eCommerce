import 'package:get/get.dart';
import 'package:spekta_store/features/shop/controllers/product/image_controller.dart';
import 'package:spekta_store/features/shop/models/product_model.dart';
import 'package:spekta_store/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// -- Select Attribute, and variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attribute to the selectedAttributes 5
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributesValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the selected variation image as a Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Assign Selected Variation
    this.selectedVariation.value = selectedVariation;

    // Update Selected product variations status
    getProductVariationStockStatus();
  }

  /// -- Check if selected attributes matches any variation attributes
  bool _isSameAttributesValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return, e.g. [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }




  /// -- Check Attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check which attributes are available and stock is not 8
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // Check Empty / Out of Stock Attributes
            variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
        // fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  /// -- Check Product Variations Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }


  /// -- Check Product Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

}