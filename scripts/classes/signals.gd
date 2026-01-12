extends Resource
class_name Signals

## Data for a saw wave
const SAW  = {
	"type": "raw_signal",
	"content": {
		"type": Enum.SignalType.SAW,
		"frequency": 440.0,
		"amplitude": 1.0
	}
}

## Data for a sine wave
const SINE  = {
	"type": "raw_signal",
	"content": {
		"type": Enum.SignalType.SINE,
		"frequency": 440.0,
		"amplitude": 1.0
	}
}

## Data for a square wave
const SQUARE  = {
	"type": "raw_signal",
	"content": {
		"type": Enum.SignalType.SQUARE,
		"frequency": 440.0,
		"amplitude": 1.0
	}
}

## Data for a triangle wave
const TRIANGLE  = {
	"type": "raw_signal",
	"content": {
		"type": Enum.SignalType.TRIANGLE,
		"frequency": 440.0,
		"amplitude": 1.0
	}
}
