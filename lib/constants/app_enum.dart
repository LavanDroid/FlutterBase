//* Toast Type
enum ToastType { normal, error }

//* normal = 1, error = 2,
extension ToastTypeId on ToastType {
  int get value {
    return [1, 2][index];
  }
}

//* Dialog Type
enum DialogType { defaults }

//* defaults = 1, userLogo = 2
extension DialogTypeId on DialogType {
  int get value {
    return [
      1,
    ][index];
  }
}

//* Application Roles
enum AppRole { admin, picker, putter, deliveryBoy }

//* Admin = 1, picker = 2, putter = 3, DeliveryBoy = 4
extension AppRoleId on AppRole {
  int get value {
    return [1, 2, 3, 4][index];
  }
}

//* Application Options
enum HomeOption { pickerOption, putterOption, deliveryOption }

//* pickerOption = 1, putterOption = 2, deliveryOption = 3,
extension HomeOptionId on HomeOption {
  int get value {
    return [1, 2, 3][index];
  }
}
