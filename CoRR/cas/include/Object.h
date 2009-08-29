/*
** Object.h
** 
** Made by Alex Nelson
** Login   <alex@tomato>
** 
** Started on  Fri Aug 28 17:27:09 2009 Alex Nelson
** Last update Fri Aug 28 17:27:09 2009 Alex Nelson
*/

#ifndef   	OBJECT_H_
# define   	OBJECT_H_

class Object
{
public:
	Object() { }
	virtual ~Object() { }
	virtual bool equals(Object *pObject) const;
	virtual bool equals(const Object &pObject) const;
	virtual std::string getClass() const;
	int hashCode() const;
	virtual std::string toString() const;
	/* operator overloading */
	bool operator==(Object const &);
protected:
	Object* clone();
	void finalize();
};
std::ostream &operator<<(std::ostream &stream, const Object &pObject);
#endif 	    /* !OBJECT_H_ */
