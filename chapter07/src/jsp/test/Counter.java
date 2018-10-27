package jsp.test;

public class Counter {

	public Counter() {
		
	}
	
	private int count = 0;
	
	public void setCounter(int count) {
		this.count = count;
	}
	public int getCounter() {
		return ++count;
	}
}
