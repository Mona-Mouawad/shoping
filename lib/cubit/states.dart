abstract class states {}
 
class initstates extends states {} 


class LoadingItemState extends states {}

class ErrorItemState extends states {
  final String? error;
  ErrorItemState(this.error);
}

class SuccessItemState extends states {}
class Loadingloginstate extends states {}
class Successloginstate extends states {}
class Errorloginstate extends states {}
class SuccessgetDatabaseState extends states {}
class Addstate extends states {}
class Substate extends states {}
class ChangeInCartstate extends states {}
class LoadingSearchState extends states {}
class SuccessSearchState extends states {}
class ErrorSearchState extends states {
  final String? Error;
  ErrorSearchState(this.Error);
}
class GetSearchState extends states {}
class LoadingGetItems_CardState extends states {}
class SuccessGetItems_CardState extends states {}