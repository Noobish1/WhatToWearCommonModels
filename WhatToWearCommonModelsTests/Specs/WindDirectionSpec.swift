import Quick
import Nimble
import Fakery
@testable import WhatToWearCommonModels

internal final class WindDirectionSpec: QuickSpec {
    internal override func spec() {
        describe("WindDirection") {
            var faker: Faker!
            
            beforeEach {
                faker = Faker()
            }
            
            describe("its init with windBearing") {
                context("when the windBearing is nil") {
                    it("should return nil") {
                        expect(WindDirection(windBearing: nil)).to(beNil())
                    }
                }
                
                context("when the windBearing is not nil") {
                    context("when the windBearing is") {
                        var direction: WindDirection!
                        
                        context("not between 0 and 360") {
                            it("should return nil") {
                                expect(WindDirection(windBearing: 400)).to(beNil())
                            }
                        }
                        
                        context("between 337.5 and 360 and 0 and 22.5") {
                            var otherDirection: WindDirection!
                            
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 337.5, max: 360)
                                )
                                otherDirection = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 0, max: 22.5)
                                )
                            }
                            
                            it("should return north") {
                                expect(direction) == .north
                                expect(otherDirection) == .north
                            }
                        }
                        
                        context("between 22.5 and 67.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 22.5, max: 67.5)
                                )
                            }
                            
                            it("should return north east") {
                                expect(direction) == .northEast
                            }
                        }
                        
                        context("between 67.5 and 112.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 67.5, max: 112.5)
                                )
                            }
                            
                            it("should return east") {
                                expect(direction) == .east
                            }
                        }
                        
                        context("between 112.5 and 157.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 112.5, max: 157.5)
                                )
                            }
                            
                            it("should return south east") {
                                expect(direction) == .southEast
                            }
                        }
                        
                        context("between 157.5 and 202.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 157.5, max: 202.5)
                                )
                            }
                            
                            it("should return south") {
                                expect(direction) == .south
                            }
                        }
                        
                        context("between 202.5 and 247.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 202.5, max: 247.5)
                                )
                            }
                            
                            it("should return south west") {
                                expect(direction) == .southWest
                            }
                        }
                        
                        context("between 247.5 and 292.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 247.5, max: 292.5)
                                )
                            }
                            
                            it("should return west") {
                                expect(direction) == .west
                            }
                        }
                        
                        context("between 292.5 and 337.5") {
                            beforeEach {
                                direction = WindDirection(
                                    windBearing: faker.number.randomDouble(min: 292.5, max: 337.5)
                                )
                            }
                            
                            it("should return north west") {
                                expect(direction) == .northWest
                            }
                        }
                    }
                }
            }
            
            describe("its arrowString") {
                context("when north") {
                    it("should return a up arrow") {
                        expect(WindDirection.north.arrowString) == "↑"
                    }
                }
                
                context("when south") {
                    it("should return a down arrow") {
                        expect(WindDirection.south.arrowString) == "↓"
                    }
                }
                
                context("when east") {
                    it("should return a right pointing arrow") {
                        expect(WindDirection.east.arrowString) == "→"
                    }
                }
                
                context("when west") {
                    it("should return a left pointing arrow") {
                        expect(WindDirection.west.arrowString) == "←"
                    }
                }
                
                context("when north east") {
                    it("should return a diagonal top right pointing arrow") {
                        expect(WindDirection.northEast.arrowString) == "↗"
                    }
                }
                
                context("when north west") {
                    it("should return a diagonal top left pointing arrow") {
                        expect(WindDirection.northWest.arrowString) == "↖"
                    }
                }
                
                context("when south east") {
                    it("should return a diagonal bottom right pointing arrow") {
                        expect(WindDirection.southEast.arrowString) == "↘"
                    }
                }
                
                context("when south west") {
                    it("should return a diagonal bottom left pointing arrow") {
                        expect(WindDirection.southWest.arrowString) == "↙"
                    }
                }
            }
        }
    }
}
