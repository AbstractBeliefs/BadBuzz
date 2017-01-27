import java.util.HashMap;

public class tbrb {
        private static final Boolean angusp = true;
	public static final String FIZZ = angusp ? "F11shh\n" : "Fizz";
	public static final String BUZZ = angusp ? "Bushh\n" : "Buzz";
	public static final String FIZZBUZZ = angusp ? BUZZ+FIZZ : FIZZ + BUZZ;
	
	public static final int maxNum = 100;
	
	public static final int loopStart = 0;
	
	private static final HashMap<Integer, Boolean> MULTIPLEBOTH = new HashMap<Integer, Boolean>();
	public static final HashMap<Integer, String> MULTIPLEFIVE = new HashMap<Integer, String>();
	static final HashMap<Integer, Integer> MULTIPLETHREE = new HashMap<Integer, Integer>();
	
	public static void watDo(int whereWeAt) {
		if ((Boolean) MULTIPLEBOTH.get(whereWeAt) == true)
			print(FIZZBUZZ);
		else if ((String) MULTIPLEFIVE.get(whereWeAt) == "Yes") {
			print(BUZZ);
		} else if ((Integer) MULTIPLETHREE.get(whereWeAt) == 1) {
			print(FIZZ);
		} else
			print(String.valueOf(whereWeAt));
	}
	
	public static void print(String printme) {
		System.out.println("[FizzBuzz] " + printme);
	}

	public static void main(String[] args) {
		omgwhatmultipliesbythreeandfive(maxNum);
		plsGETmyMultiplesOfFive();
		WORKOUTMULTIPLESTHREE(loopStart);
		perform_loop(maxNum);
	}
	
	public static void perform_loop(int max) {
		for (int i=loopStart; i < max; i++) {
			watDo(i);
		}
	}

	private static void omgwhatmultipliesbythreeandfive(int max) {
		for (int i=loopStart; i<=maxNum; i++) {
			if (i%3==0 && i%5==0) {
				MULTIPLEBOTH.put(i, true);
			} else {
				MULTIPLEBOTH.put(i, false);
			}
		}
	}
	
	private static void plsGETmyMultiplesOfFive() {
		for (int i=0; i<=maxNum; i++) {
			StringBuilder numBuilder = new StringBuilder();
			numBuilder.append(i);
			String number = numBuilder.toString();
			
			if (i == 5) {
				MULTIPLEFIVE.put(i, "Yes");
			} else if (number.substring(number.length() - 1).equals("5") || number.substring(number.length() - 1).equals("0")) {
				MULTIPLEFIVE.put(i, "Yes");
			} else {
				MULTIPLEFIVE.put(i, "No");
			}
		}
	}
	
	public static void WORKOUTMULTIPLESTHREE(int begin) {
		for (int i=begin; i <= maxNum; i++) {
			if (i%3==0) {
				MULTIPLETHREE.put(i, 1);
			} else {
				MULTIPLETHREE.put(i, 0);
			}
		}
	}
}

