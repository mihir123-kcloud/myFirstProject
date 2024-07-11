public class SpoonacularWrapper {

	public class UsedIngredients {
		public Integer id;
		public Double amount;
		public String unit;
		public String unitLong;
		public String unitShort;
		public String aisle;
		public String name;
		public String original;
		public String originalName;
		public List<String> meta;
		public String image;
	}

	public class UnusedIngredients {
	}

	public Integer id;
	public String title;
	public String image;
	public String imageType;
	public Integer usedIngredientCount;
	public Integer missedIngredientCount;
	public List<MissedIngredients> missedIngredients;
	public List<UsedIngredients> usedIngredients;
	public List<UnusedIngredients> unusedIngredients;
	public Integer likes;

	public class MissedIngredients_Z {
		public Integer id;
		public Double amount;
		public String unit;
		public String unitLong;
		public String unitShort;
		public String aisle;
		public String name;
		public String original;
		public String originalName;
		public List<UnusedIngredients> meta;
		public String image;
	}

	public class MissedIngredients {
		public Integer id;
		public Double amount;
		public String unit;
		public String unitLong;
		public String unitShort;
		public String aisle;
		public String name;
		public String original;
		public String originalName;
		public List<String> meta;
		public String extendedName;
		public String image;
	}

	
	public static List<SpoonacularWrapper> parse(String json) {
		return (List<SpoonacularWrapper>) System.JSON.deserialize(json, List<SpoonacularWrapper>.class);
	}
}