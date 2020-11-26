package main

import (
	"testing"
)

func TestFunc(t *testing.T) {
	tests := []struct{
		name string
		input string
		want int
	}{}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			got := 0
			if got != test.want {
				t.Errorf("got: %v, want: %v", got, test.want)
			}
		})
	}
}
