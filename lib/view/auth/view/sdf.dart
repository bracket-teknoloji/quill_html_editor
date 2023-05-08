class Sdf {
        static Sdf? _instance;
        // Avoid self instance
        Sdf._();
        static Sdf get instance{
            _instance??=  Sdf._();
			return _instance!;
        }
}