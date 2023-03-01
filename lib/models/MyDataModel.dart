class MyDataModel {
  static Map processData(Map userData) {
    String getInitials(String userName) {
      List<String> names = userName.split(" ");
      String initials = "";
      int numWords = 2;

      if (numWords < names.length) {
        numWords = names.length;
      }
      for (var i = 0; i < names.length - 1; i++) {
        initials += '${names[i][0]}.';
      }
      initials += names[names.length - 1];
      return initials;
    }

    String getAddress(String address) {
      List<String> lanes = address.split(",");
      String newAddress = "";
      for (var i = lanes.length - 1; i > 0 - 1; i--) {
        if (i == 0) {
          newAddress += '${lanes[i]}.';
        } else {
          newAddress += '${lanes[i]},';
        }
      }
      return newAddress;
    }

    String contactNoType(String contactNo) {
      contactNo = contactNo.padLeft(10, '0');
      if (contactNo[1] == '7') {
        return "Mobile No";
      } else {
        return "Landline";
      }
    }

    String convertInternational(String contactNo) {
      contactNo = contactNo.padLeft(10, '0');
      String newContact = "+94";
      for (var i = 1; i < contactNo.length; i++) {
        newContact += contactNo[i];
      }
      return newContact;
    }

    int getAge(DateTime age) {
      final difference = DateTime.now().difference(age);
      double yearsdif = difference.inDays / 365;
      return yearsdif.toInt();
    }

    double calculateTax(String memType) {
      double membershipPrice = 0;
      if (memType == "VIP") {
        membershipPrice = 5000 * 112 / 100;
      } else if (memType == "Gold") {
        membershipPrice = 4000 * 112 / 100;
      } else if (memType == "General") {
        membershipPrice = 3000 * 112 / 100;
      }
      return membershipPrice;
    }

    String withoutTaxVal(String type) {
      String val = "0";
      if (type == "VIP") {
        val = "5000";
      } else if (type == "Gold") {
        val = "4000";
      } else if (type == "General") {
        val = "3000";
      }
      return val;
    }

    return {
      'fullname': userData['name'],
      'initname': getInitials(userData['name']),
      'address': userData['address'],
      'readdress': getAddress(userData['address']),
      'lcontact': userData['mobile'],
      'icontact': convertInternational(userData['mobile']),
      'ctype': contactNoType(userData['mobile']),
      'gender': userData['gender'],
      'age': getAge(userData['birthday']),
      'birthday': userData['birthday'],
      'memtype': userData['memtype'],
      'withouttax': withoutTaxVal(userData['memtype']),
      'finalamount': calculateTax(userData['memtype'])
    };
  }
}
